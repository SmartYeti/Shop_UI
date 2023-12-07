import 'package:shop_ui/features/branch/data/repository/branch.repository.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/shop/data/repository/shop_repository.dart';
import 'package:shop_ui/features/shop/domain/bloc/shop_bloc.dart';

class DIContainer {
  ShopRepository get _shopRepository => ShopRepository();

  ShopBloc get shopBloc => ShopBloc(_shopRepository);

  BranchRepository get _branchRepository => BranchRepository();

  BranchBloc get branchBloc => BranchBloc(_branchRepository);
}