import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/shop/presentation/shop.dart';
// import 'package:shop_ui/features/branch/presentation/branch.dart';
import 'package:shop_ui/features/shop/domain/bloc/shop_bloc.dart';
// import 'package:shop_ui/features/shop/presentation/shop.dart';

class HomeDash extends StatefulWidget {
  const HomeDash({super.key});

  @override
  State<HomeDash> createState() => _HomeDashState();
}

class _HomeDashState extends State<HomeDash> {
  final DIContainer diContainer = DIContainer();
  late ShopBloc _shopBloc;

  @override
  void initState() {
    super.initState();
    _shopBloc = BlocProvider.of<ShopBloc>(context);
    _shopBloc.add(GetShopEvent());
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocConsumer<ShopBloc, ShopState>(
      listener: _shopListener,
      builder: (context, state) {
        if (state.stateStatus == StateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   child: IconButton(
                  //       alignment: Alignment.topLeft,
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => const LoginPage()));
                  //       },
                  //       icon: const Icon(
                  //         Icons.arrow_back_ios_new_rounded,
                  //         size: 50,
                  //         color: Colors.grey,
                  //       )),
                  // ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'DASHBOARD',
                        style: GoogleFonts.ptSerif(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(40, 120, 19, 1),
                              fontSize: 50,
                              letterSpacing: .5),
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 40,
                        width: 1400,
                        child: Container(
                          height: 100,
                          width: 10,
                          margin: const EdgeInsets.only(
                              bottom: 5, right: 50, left: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white54,
                            boxShadow: const [BoxShadow()],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Text(
                                      'Shop-ID',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Text(
                                      'Shop',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Address',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                // Padding(padding: EdgeInsets.all(2)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    // final isSmallScreen = MediaQuery.of(context).size.width < 600;
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: screenSize.height / 1.3,
                          width: 1400,
                          child: ListView.builder(
                              itemCount: state.shopModel.length,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              itemBuilder: (context, index) {
                                final shoplist = state.shopModel[index];
                                return Container(
                                  height: 100,
                                  width: 10,
                                  margin: const EdgeInsets.only(
                                      bottom: 10, right: 50, left: 50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white70,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 5.0,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Your click event code here
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BlocProvider(
                                            create: (context) =>
                                                diContainer.branchBloc,
                                            child: ShopPage1(
                                              shopId: shoplist.shopId,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          50, 5, 50, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                shoplist.shopId,
                                                style: GoogleFonts.ptSerif(
                                                  textStyle: const TextStyle(
                                                      color: Colors.brown,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                maxLines: 1,
                                                softWrap: false,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Text(
                                                shoplist.shopName,
                                                style: GoogleFonts.ptSerif(
                                                  textStyle: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                maxLines: 1,
                                                softWrap: false,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Text(
                                                shoplist.address1,
                                                style: GoogleFonts.ptSerif(
                                                  textStyle: const TextStyle(
                                                      color: Colors.brown,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                maxLines: 1,
                                                softWrap: false,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void _shopListener(BuildContext context, ShopState state) {
  if (state.stateStatus == StateStatus.error) {
    return SnackBarUtils.defualtSnackBar(state.errorMessage, context);
  }
}
