// ignore_for_file: prefer_const_constructors_in_immutables

part of 'shop_bloc.dart';

@immutable
class ShopState {
  final StateStatus stateStatus;
  final String? errorMessage;
  final List<ShopModel> shopModel;
  final bool isAdded;

  ShopState({
    required this.stateStatus,
    required this.shopModel,
    this.errorMessage,
    required this.isAdded,
  });

  factory ShopState.inital() => ShopState(
        stateStatus: StateStatus.initial,
        shopModel: const [],
        isAdded: false,
      );

  ShopState copyWith({
    StateStatus? stateStatus,
    String? errorMessage,
    List<ShopModel>? shopModel,
    bool? isAdded,
  }) {
    return ShopState(
      stateStatus: stateStatus ?? this.stateStatus,
      shopModel: shopModel ?? this.shopModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isAdded: isAdded ?? this.isAdded,
    );
  }
}
