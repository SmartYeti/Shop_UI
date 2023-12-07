// ignore_for_file: prefer_const_constructors_in_immutables

part of 'branch_bloc.dart';

@immutable

 class BranchState {
  final StateStatus stateStatus;
  final String? errorMessage;
  final List<BranchModel> branchModel;

  BranchState({
    required this.stateStatus,
    required this.branchModel,
    this.errorMessage,
  });

  factory BranchState.inital() => BranchState(
    stateStatus: StateStatus.initial,
    branchModel: const [],
    );

  BranchState copyWith({
    StateStatus? stateStatus,
    String? errorMessage,
    List<BranchModel>? branchModel,
  }) {
    return BranchState(
      stateStatus: stateStatus ?? this.stateStatus, 
      branchModel: branchModel ?? this.branchModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
 }