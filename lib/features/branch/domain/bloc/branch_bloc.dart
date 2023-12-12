import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/features/branch/data/repository/branch.repository.dart';
import 'package:shop_ui/features/branch/domain/models/branch.model.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc(BranchRepository branchRepository) : super(BranchState.inital()) {
    on<GetBranchEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final Either<String, List<BranchModel>> result = await branchRepository.getBranch(event.shopId);
      // print(result);
      result.fold((error){
        emit(state.copyWith(
            stateStatus: StateStatus.error, errorMessage: error));
        emit(state.copyWith(stateStatus: StateStatus.loaded));

      }, (branchList){
        if(branchList.isNotEmpty) {
          emit(state.copyWith(
            branchModel: branchList,
            stateStatus: StateStatus.loaded
          ));
        } else {
          emit(state.copyWith(isEmpty: true));
        }
      });
      emit(state.copyWith(stateStatus: StateStatus.loaded));
    });
  }
}