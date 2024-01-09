import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/auth/domain/models/auth_model.dart';
import 'package:shop_ui/features/auth/presentation/login.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/shop/presentation/shop_admin.dart';
import 'package:shop_ui/features/shop/presentation/shop_new.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key, required this.authModel});
  final AuthModel authModel;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final DIContainer diContainer = DIContainer();
  late AuthBloc _authBloc;
  late AuthModel _authModel;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(AutoLoginEvent());
    _authModel = widget.authModel;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _authListener,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _authListener(BuildContext context, AuthState state) {
    if (state.stateStatus == StateStatus.error ||
        state.token == null && state.stateStatus == StateStatus.loaded) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _authBloc,
            child: const LoginPage(),
          ),
        ),
      );
      return;
    }

    if (state.token != null && state.stateStatus == StateStatus.loaded) {
      if (_authModel.restriction.isEmpty) {
        print('EMPTY');
        //TODO: Route to display all branches of a shop, use shopId for query
        SnackBarUtils.successSnackBar('Login Success', context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (BuildContext context) => diContainer.authBloc,
                ),
                BlocProvider<BranchBloc>(
                  create: (context) => diContainer.branchBloc,
                ),
              ],
              child: const ShopAdminPage(),
            ),
          ),
        );
        return;
      } else {
        //TODO: Route to display shopDrop and display restriction in dropdown menu ** state.authModel!.restriction.length**
        SnackBarUtils.successSnackBar('Login Success', context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (BuildContext context) => diContainer.authBloc,
                ),
                BlocProvider<BranchBloc>(
                  create: (context) => diContainer.branchBloc,
                ),
              ],
              child: const ShopPage(),
            ),
          ),
        );
        return;
      }
    }
  }
}
