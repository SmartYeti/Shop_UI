import 'package:flutter/material.dart';
import 'package:shop_ui/features/branch/presentation/branchadd.dart';
import 'package:shop_ui/features/branch/presentation/branchdash.dart';
import 'package:shop_ui/features/shop/domain/models/shop_model.dart';
import 'package:shop_ui/features/shop/presentation/shopdash.dart';
import 'package:shop_ui/features/presentation/pages/login.dart';
import 'package:shop_ui/features/shop/presentation/shopinfo.dart';
import 'package:sidebarx/sidebarx.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key, required this.shopModel});
  final ShopModel shopModel;

  @override
  State<ShopPage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<ShopPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _key = GlobalKey<ScaffoldState>();
  late ShopModel _shopModel;

  @override
  void initState() {
    super.initState();
    _shopModel = widget.shopModel;
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              title: const Text(''),
              leading: IconButton(
                onPressed: () {
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: SidebarX(
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
          width: 200,
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
              child: Icon(
                Icons.person,
                color: white,
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
          // SidebarXItem(
          //   icon: Icons.search,
          //   label: 'Search',
          //   onTap: () {
          //     // debugPrint('Search');
          //   },
          // ),
          const SidebarXItem(
            icon: Icons.add_circle,
            label: 'Add',
          ),
          const SidebarXItem(
            icon: Icons.info,
            label: 'Info',
          ),
          const SidebarXItem(
            icon: Icons.person,
            label: 'Employees',
          ),
        ],
        footerItems: [
          SidebarXItem(
            icon: Icons.power_settings_new_rounded,
            label: 'Logout',
            onTap: () {
              // debugPrint('Logout');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          )
        ],
      )
      // ExampleSidebarX(controller: _controller)
      ,
      body: Row(
        children: [
          if (!isSmallScreen)
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
                width: 200,
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
                    child: Icon(
                      Icons.person,
                      color: white,
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
                // SidebarXItem(
                //   icon: Icons.search,
                //   label: 'Search',
                //   onTap: () {
                //     // debugPrint('Search');
                //   },
                // ),
                const SidebarXItem(
                  icon: Icons.add_circle,
                  label: 'Add',
                ),
                const SidebarXItem(
                  icon: Icons.info,
                  label: 'Info',
                ),
                const SidebarXItem(
                  icon: Icons.person,
                  label: 'Employees',
                ),
              ],
              footerItems: [
                SidebarXItem(
                  icon: Icons.power_settings_new_rounded,
                  label: 'Logout',
                  onTap: () {
                    // debugPrint('Logout');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                )
              ],
            )
          // ExampleSidebarX(controller: _controller)
          ,
          Expanded(
            child: _ScreensExample(
              controller: _controller,
              shopModel: _shopModel,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({
    required this.controller,
    required this.shopModel,
  });

  final SidebarXController controller;
  final ShopModel shopModel;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  late ShopModel _shopModel;
  @override
  void initState() {
    super.initState();
    _shopModel = widget.shopModel;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(widget.controller.selectedIndex);
        switch (widget.controller.selectedIndex) {
          case 0:
            return ShopDash(
              shopModel: _shopModel,
            );
          case 1:
            return AddBranchPage(
              shopId: _shopModel.shopId,
            );
          case 2:
            return const InfoShopPage();
          case 3:
            return const BranchDash();
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
// Future<void> _shopInfo(BuildContext context) {

//   return showDialog<void>(
//   context: context,
//   barrierDismissible: false, // user must tap button!
//   builder: (BuildContext context) {
//     return AlertDialog(
//       title: const Text('Shop Info'),
//       content: const SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[

//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//           children: [
//             Text(
//               'Shop-ID: ',
//               style: TextStyle(color: Colors.white),
//             ),
//             Text(
//               'Shop-1',
//               style: TextStyle(color: Colors.white),
//               textAlign: TextAlign.start,
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//           children: [
//             Text(
//               'Address 1: ',
//               style: TextStyle(color: Colors.white),
//             ),
//             Text(
//               'Mandaue City',
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//           children: [
//             Text(
//               'Address 2: ',
//               style: TextStyle(color: Colors.white),
//             ),
//             Text(
//               'Liloan',
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//           children: [
//             Text(
//               'Notes',
//               style: TextStyle(color: Colors.white),
//             ),
//             Text(
//               'No Notes',
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//           children: [
//             Text(
//               'Remark',
//               style: TextStyle(color: Colors.white),
//             ),
//             Text(
//               'Good Remarks',
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ),

//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: const Text('Approve'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   },
// );
// }

// _searchBar(BuildContext context){
//   return SingleChildScrollView(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Container(
//               alignment: Alignment.topCenter,
//               child: Column(
//                 children: [

//                   Container(
//                     padding: const EdgeInsets.all(5),
//                     alignment: Alignment.topCenter,
//                     child: SizedBox(
//                       // height: 50,
//                       // width: 500,

//                       child: SearchAnchor(
//                           viewSurfaceTintColor: Colors.white70,
//                           viewBackgroundColor: Colors.white70,
//                           builder: (BuildContext context,
//                               SearchController controller) {
//                             return SearchBar(
//                               controller: controller,
//                               padding:
//                                   const MaterialStatePropertyAll<EdgeInsets>(
//                                       EdgeInsets.symmetric(horizontal: 16.0)),
//                               onTap: () {
//                                 controller.openView();
//                               },
//                               onChanged: (_) {
//                                 controller.openView();
//                               },
//                               leading: const Icon(Icons.search),
//                             );
//                           },
//                           suggestionsBuilder: (BuildContext context,
//                               SearchController controller) {
//                             return List<ListTile>.generate(5, (int index) {
//                               final String item = 'item $index';
//                               return ListTile(
//                                 title: Text(item),
//                                 onTap: () {
//                                   controller.closeView(item);
//                                 },
//                               );
//                             });
//                           }),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
// }
// }

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'Add';
    case 3:
      return 'Favorites';
    // case 4:
    //   return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    case 7:
      return 'Logout';
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
