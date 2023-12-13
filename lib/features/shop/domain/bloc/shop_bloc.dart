import 'package:flutter/material.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/features/shop/data/repository/shop_repository.dart';
import 'package:shop_ui/features/shop/domain/models/add_shop.model.dart';
import 'package:shop_ui/features/shop/domain/models/shop_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

part 'shop_state.dart';
part 'shop_event.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc(ShopRepository shopRepository) : super(ShopState.inital()) {
    on<GetShopEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final Either<String, List<ShopModel>> result =
          await shopRepository.getShop();
      result.fold((error) {
        emit(state.copyWith(
            stateStatus: StateStatus.error, errorMessage: error));
        emit(state.copyWith(stateStatus: StateStatus.loaded));
      }, (shopList) {
        if (shopList.isNotEmpty) {
          emit(state.copyWith(
              shopModel: shopList, stateStatus: StateStatus.loaded));
        }
      });
      emit(state.copyWith(stateStatus: StateStatus.loaded));
    });
    on<AddShopEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final Either<String, dynamic> result =
          await shopRepository.addShop(event.addShopModel);
      result.fold((error) {
        emit(state.copyWith(
            stateStatus: StateStatus.error, errorMessage: error));
        emit(state.copyWith(stateStatus: StateStatus.loaded));
      }, (addShop) {
        if (addShop == 200) {
          final currentShopList = state.shopModel;
          emit(state.copyWith(
            shopModel: [
              ...currentShopList,
              // ShopModel(
              //   id: int.parse(addShop),
              //   shopId: event.addShopModel.shopId,
              //   shopName: event.addShopModel.shopName,
              //   address1: event.addShopModel.address1,
              //   address2: event.addShopModel.address2,
              //   notes: event.addShopModel.notes,
              //   remark: event.addShopModel.remark,
              // ),
            ],
            isAdded: true,
            stateStatus: StateStatus.loaded,
          ));
        } else {
          emit(state.copyWith(stateStatus: StateStatus.error));
        }

        emit(state.copyWith(stateStatus: StateStatus.loaded));
      });
    });
  }
}
