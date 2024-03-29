// ignore_for_file: prefer_const_constructors_in_immutables

part of 'branch_bloc.dart';

@immutable
class BranchState {
  final StateStatus stateStatus;
  final String? errorMessage;
  final List<BranchModel> branchModel;
  final BranchModel? branchModel1;
  final bool isEmpty;
  final bool isAdded;
  final bool isUpdated;

  BranchState({
    required this.stateStatus,
    required this.branchModel,
    this.errorMessage,
    required this.isEmpty,
    required this.isAdded,
    this.branchModel1,
    required this.isUpdated,
  });

  factory BranchState.inital() => BranchState(
        stateStatus: StateStatus.initial,
        branchModel: const [],
        isEmpty: false,
        isAdded: false,
        isUpdated: false,
      );

  BranchState copyWith({
    StateStatus? stateStatus,
    String? errorMessage,
    List<BranchModel>? branchModel,
    bool? isEmpty,
    bool? isAdded,
    BranchModel? branchModel1,
    bool? isUpdated,
  }) {
    return BranchState(
      stateStatus: stateStatus ?? this.stateStatus,
      branchModel: branchModel ?? this.branchModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isEmpty: isEmpty ?? this.isEmpty,
      isAdded: isAdded ?? this.isAdded,
      branchModel1: branchModel1 ?? this.branchModel1,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}
