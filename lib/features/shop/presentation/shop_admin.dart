import 'package:flutter/material.dart';
import 'package:shop_ui/features/branch/presentation/branchadd.dart';
import 'package:shop_ui/features/shop/presentation/shopdropdown.dart';
import 'package:shop_ui/features/shop/presentation/shopinfo.dart';
// import 'package:shop_ui/features/branch/presentation/branchdash.dart';
import 'package:sidebarx/sidebarx.dart';

class ShopAdminPage extends StatefulWidget {
  const ShopAdminPage({
    super.key,
    // required this.shopModel
  });
  // final ShopModel shopModel;

  @override
  State<ShopAdminPage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<ShopAdminPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: false);

  final _key = GlobalKey<ScaffoldState>();
  // late ShopModel _shopModel;

  // @override
  // void initState() {
  //   super.initState();
  //   _shopModel = widget.shopModel;
  // }

  @override
  Widget build(BuildContext context) {
    // final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      appBar:
          // isSmallScreen
          //     ?
          AppBar(
        backgroundColor: canvasColor,
        title: const Text(''),
        // leading: IconButton(
        //   onPressed: () {
        //     // if (!Platform.isAndroid && !Platform.isIOS) {
        //     //   _controller.setExtended(true);
        //     // }
        //     _key.currentState?.openDrawer();
        //   },
        //   icon: const Icon(Icons.menu, color: white,),
        // ),
        actions: [
          const Tooltip(
              message: 'Admin',
              child: Icon(
                Icons.person,
                color: white,
              )),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(
                Icons.power_settings_new_rounded,
                color: white,
              )),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      // drawer: Sidebar(controller: _controller),
      // : null,
      body: Row(
        children: [
          SidebarX(
            controller: _controller,
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: canvasColor,
                borderRadius: BorderRadius.circular(20),
              ),
              hoverColor: scaffoldBackgroundColor,
              textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: canvasColor),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: actionColor.withOpacity(0.37),
                ),
                gradient: const LinearGradient(
                  colors: [accentCanvasColor, canvasColor],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  )
                ],
              ),
              iconTheme: IconThemeData(
                color: Colors.white.withOpacity(0.7),
                size: 20,
              ),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            extendedTheme: const SidebarXTheme(
              width: 230,
              decoration: BoxDecoration(
                color: canvasColor,
              ),
            ),
            // footerDivider: divider,
            headerBuilder: (context, extended) {
              return const SizedBox(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  // child: Image.asset('images/house2.jpg')
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Icon(
                      Icons.shopify_rounded,
                      color: white,
                      size: 50,
                    ),
                  )
                  // Text('Image', selectionColor: Colors.white,)
                  // Image.asset('assets/images/avatar.png')
                  ,
                ),
              );
            },
            items: [
              SidebarXItem(
                icon: Icons.home,
                label: 'Home',
                onTap: () {
                  // debugPrint('Home');
                },
              ),

              const SidebarXItem(
                icon: Icons.add_circle,
                label: 'Register Branch',
              ),
              const SidebarXItem(
                icon: Icons.info,
                label: 'Shop Info',
              ),
              const SidebarXItem(
                icon: Icons.published_with_changes_rounded,
                label: 'Transaction',
              ),
              const SidebarXItem(
                icon: Icons.report_gmailerrorred_rounded,
                label: 'Report',
              ),
              const SidebarXItem(
                icon: Icons.library_books,
                label: 'List',
              ),
              const SidebarXItem(
                icon: Icons.build_circle_outlined,
                label: 'Shop Maintenance',
              ),
              const SidebarXItem(
                icon: Icons.attribution_sharp,
                label: 'Employee Maintenance',
              ),
              // const SidebarXItem(
              //   icon: Icons.person,
              //   label: 'Employees',
              // ),
            ],
            // footerItems: [
            //   SidebarXItem(
            //     icon: Icons.power_settings_new_rounded,
            //     label: 'Logout',
            //     onTap: () {
            //       // debugPrint('Logout');
            //       // Navigator.push(context,
            //       //     MaterialPageRoute(builder: (context) => const LoginPage()));
            //     },
            //   )
            // ],
          ),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
                // shopModel: _shopModel,
              ),
            ),
          ),
        ],
      )
      // ExampleSidebarX(controller: _controller)
      ,
      // body: Row(
      //   children: [
      //     Expanded(
      //       child: Center(
      //         child: _ScreensExample(
      //           controller: _controller,
      //           // shopModel: _shopModel,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: const BottomAppBar(
        color: canvasColor,
        surfaceTintColor: canvasColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Copyright © 2023',
              style: TextStyle(color: white),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({
    required this.controller,
    // required this.shopModel,
  });

  final SidebarXController controller;
  // final ShopModel shopModel;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  // late ShopModel _shopModel;
  // @override
  // void initState() {
  //   super.initState();
  //   // _shopModel = widget.shopModel;
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(widget.controller.selectedIndex);
        switch (widget.controller.selectedIndex) {
          case 0:
            return const ShopDrop(
                // shopModel: _shopModel,
                );
          case 1:
            return const AddBranchPage(
              shopId: '',
              // shopId: _shopModel.shopId,
            );
          case 2:
            return const InfoShopPage();
          // case 3:
          //   return const BranchDash();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'Add';
    case 3:
      return 'Transaction';
    case 4:
      return 'Report';
    case 5:
      return 'List';
    case 6:
      return 'Shop Maintenance';
    case 7:
      return 'Employee Maintenance';
    // case 7:
    //   return 'Logout';
    default:
      return 'Not found page';
  }
}

const textColor = Colors.brown;
const primaryColor = Colors.black38;
const canvasColor = Colors.brown;
const scaffoldBackgroundColor = Colors.white38;
const accentCanvasColor = Color.fromRGBO(40, 120, 19, 1);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

//
