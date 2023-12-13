import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/shop/domain/models/shop_model.dart';

import '../../branch/presentation/branch.dart';

class ShopDash extends StatefulWidget {
  const ShopDash({super.key, required this.shopModel});
  final ShopModel shopModel;
  @override
  State<ShopDash> createState() => _ShopDashState();
}

class _ShopDashState extends State<ShopDash> {
  late BranchBloc _branchBloc;
  late ShopModel _shopModel;
  final DIContainer diContainer = DIContainer();

  @override
  void initState() {
    super.initState();
    _branchBloc = BlocProvider.of<BranchBloc>(context);
    _shopModel = widget.shopModel;
    _branchBloc.add(GetBranchEvent(shopId: _shopModel.shopId));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<BranchBloc, BranchState>(
      listener: _branchListener,
      builder: (context, state) {
        if (state.stateStatus == StateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                  // alignment: Alignment.topLeft,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 50,
                    color: Colors.grey,
                  )),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      child: Text(
                        '-SHOP NAME- DASHBOARD',
                        style: GoogleFonts.ptSerif(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(40, 120, 19, 1),
                            fontSize: 50,
                            // letterSpacing: .5
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _searchBar(context),

                  SizedBox(
                      height: 20,
                      width: screenSize.width / 1.4,
                      child: const Divider(
                        thickness: 2,
                      )),

                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.bottomCenter,
                    height: screenSize.width / 4.5,
                    width: screenSize.width / 1.4,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse
                          }),
                      child: Builder(builder: (context) {
                        if (state.isEmpty == true) {
                          return const Center(
                            child: Text('No Branch to display'),
                          );
                        }
                        return ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.branchModel.length,
                          padding: const EdgeInsets.only(top: 10),
                          itemBuilder: (context, index) {
                            final branchList = state.branchModel[index];
                            return SizedBox(
                              height: screenSize.height / 10,
                              width: screenSize.width / 3.8,
                              child: Container(
                                // height: 1500,
                                // width: 500,
                                margin: const EdgeInsets.only(
                                    bottom: 15, right: 20, left: 20),
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
                                child: FloatingActionButton(
                                  heroTag: 'btn $index',
                                  hoverColor: Colors.grey.shade400,
                                  splashColor: Colors.white38,
                                  backgroundColor: Colors.white70,
                                  onPressed: () {
                                    // Your click event code here
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BlocProvider(
                                                  create: (context) =>
                                                    diContainer.branchBloc,
                                                  child: const BranchPage(),
                                                )));
                                  },
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          50, 5, 50, 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              branchList.branchId,
                                              style: GoogleFonts.ptSerif(
                                                textStyle: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              branchList.branchName,
                                              style: GoogleFonts.ptSerif(
                                                textStyle: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 50,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 100,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              branchList.address1,
                                              style: GoogleFonts.ptSerif(
                                                textStyle: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              branchList.dateOpened,
                                              style: GoogleFonts.ptSerif(
                                                textStyle: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                  // ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void _branchListener(BuildContext context, BranchState state) {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.defualtSnackBar(state.errorMessage, context);
    }
  }

  _searchBar(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 800,
            child: SearchAnchor(
                viewSurfaceTintColor: Colors.white70,
                viewBackgroundColor: Colors.white70,
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';

                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        controller.closeView(item);
                      },
                    );
                  });
                }),
          ),
        ),
      ),
    );
  }
}
