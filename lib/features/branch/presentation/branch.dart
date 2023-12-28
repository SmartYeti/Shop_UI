import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/branch/presentation/branchinfo.dart';
import 'package:shop_ui/features/employee/presentation/employeeadd.dart';
import 'package:shop_ui/features/branch/presentation/branchdash.dart';
// import 'package:shop_ui/features/auth/presentation/login.dart';
// import 'package:shop_ui/features/presentation/pages/shopdash.dart';
import 'package:sidebarx/sidebarx.dart';

class BranchPage extends StatefulWidget {
  const BranchPage({super.key});

  @override
  State<BranchPage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<BranchPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _key = GlobalKey<ScaffoldState>();
  late BranchBloc _branchBloc;

  @override
  void initState() {
    _branchBloc = BlocProvider.of<BranchBloc>(context);
    super.initState();
  }

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
        leading: IconButton(
          onPressed: () {
            // if (!Platform.isAndroid && !Platform.isIOS) {
            //   _controller.setExtended(true);
            // }
            _key.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: white,
          ),
        ),
        actions: [
          const Tooltip(
              message: 'Manager',
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
      // : null,
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
              // child: Image.asset('images/house2.jpg')
              child: Icon(
                Icons.shopify_rounded,
                color: white,
                size: 50,
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
            label: 'Add',
          ),
          const SidebarXItem(
            icon: Icons.info,
            label: 'Info',
          ),
        ],
        // footerItems: [
        //   SidebarXItem(
        //     icon: Icons.power_settings_new_rounded,
        //     label: 'Logout',
        //     onTap: () {
        //       // debugPrint('Logout');
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => const LoginPage()));
        //     },
        //   )
        // ],
      )

      // ExampleSidebarX(controller: _controller)
      ,
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
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
      // body: Row(
      //   children: [
      //     if (!isSmallScreen)
      //       SidebarX(
      //         controller: _controller,
      //         theme: SidebarXTheme(
      //           margin: const EdgeInsets.all(10),
      //           decoration: BoxDecoration(
      //             color: canvasColor,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           hoverColor: scaffoldBackgroundColor,
      //           textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
      //           selectedTextStyle: const TextStyle(color: Colors.white),
      //           itemTextPadding: const EdgeInsets.only(left: 30),
      //           selectedItemTextPadding: const EdgeInsets.only(left: 30),
      //           itemDecoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(10),
      //             border: Border.all(color: canvasColor),
      //           ),
      //           selectedItemDecoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(10),
      //             border: Border.all(
      //               color: actionColor.withOpacity(0.37),
      //             ),
      //             gradient: const LinearGradient(
      //               colors: [accentCanvasColor, canvasColor],
      //             ),
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.black.withOpacity(0.28),
      //                 blurRadius: 30,
      //               )
      //             ],
      //           ),
      //           iconTheme: IconThemeData(
      //             color: Colors.white.withOpacity(0.7),
      //             size: 20,
      //           ),
      //           selectedIconTheme: const IconThemeData(
      //             color: Colors.white,
      //             size: 20,
      //           ),
      //         ),
      //         extendedTheme: const SidebarXTheme(
      //           width: 200,
      //           decoration: BoxDecoration(
      //             color: canvasColor,
      //           ),
      //         ),
      //         // footerDivider: divider,
      //         headerBuilder: (context, extended) {
      //           return const SizedBox(
      //             height: 100,
      //             child: Padding(
      //               padding: EdgeInsets.all(16.0),
      //               child: Icon(
      //                 Icons.person,
      //                 color: white,
      //               ),
      //             ),
      //           );
      //         },
      //         items: [
      //           SidebarXItem(
      //             icon: Icons.home,
      //             label: 'Home',
      //             onTap: () {
      //               // debugPrint('Home');
      //             },
      //           ),
      //           const SidebarXItem(
      //             icon: Icons.add_circle,
      //             label: 'Add',
      //           ),
      //           const SidebarXItem(
      //             icon: Icons.info,
      //             label: 'Info',
      //           ),
      //         ],
      //         footerItems: [
      //           SidebarXItem(
      //             icon: Icons.power_settings_new_rounded,
      //             label: 'Logout',
      //             onTap: () {
      //               // debugPrint('Logout');
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const LoginPage()));
      //             },
      //           )
      //         ],
      //       )

      //     // ExampleSidebarX(controller: _controller)
      //     ,
      //     Expanded(
      //       child: _ScreensExample(
      //         controller: _controller,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({
    required this.controller,
  });

  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(widget.controller.selectedIndex);
        switch (widget.controller.selectedIndex) {
          case 0:
            return const BranchDash();

          case 1:
            return const AddEmpPage();

          case 2:
            return const InfoBranchPage();

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
    // case 1:
    //   return 'Search';
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
