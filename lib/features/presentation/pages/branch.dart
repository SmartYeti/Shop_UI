// import 'dart:js_util';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/features/presentation/pages/login.dart';
// import 'package:shop_ui/features/presentation/pages/shopinfo.dart';
import 'package:sidebarx/sidebarx.dart';

class BranchPage extends StatefulWidget {
  const BranchPage({Key? key}) : super(key: key);

  @override
  State<BranchPage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<BranchPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
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
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
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
          icon: Icons.favorite,
          label: 'Favorites',
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
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return SingleChildScrollView(
              child: Column(
                children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '-SHOP NAME- DASHBOARD',
                        style: GoogleFonts.ptSerif(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(40, 120, 19, 1),
                              fontSize: 50,
                              letterSpacing: .5),
                        ),
                      ),
                    ),
                  _searchBar(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          iconSize: 40,
                          padding: const EdgeInsets.all(10),
                          onPressed: () {
                            _shopInfo(context);
                          },
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.grey.shade600,
                          )),
                      const SizedBox(
                        width: 650,
                      ),
                      Row(
                        children: [
                          IconButton(
                              iconSize: 40,
                              padding: const EdgeInsets.all(10),
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_to_photos_sharp,
                                color: Colors.grey.shade600,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              iconSize: 40,
                              padding: const EdgeInsets.all(10),
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit_document,
                                color: Colors.grey.shade600,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 5,
                    width: 1400,
                    margin: const EdgeInsets.only(
                        bottom: 5, right: 50, left: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white54,
                      boxShadow: const [BoxShadow()],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.bottomCenter,
                    height: 500,
                    width: 1300,
                    child: SizedBox(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                            dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse
                          }),
                          child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          padding: const EdgeInsets.only(top: 10),
                          itemBuilder: (context, index) => Container(
                            height: 1500,
                            width: 500,
                            margin: const EdgeInsets.only(
                                bottom: 15, right: 50, left: 50),
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
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 5, 50, 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 300,
                                      height: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          'Branch-1',
                                          style: GoogleFonts.ptSerif(
                                            textStyle: const TextStyle(
                                                color: Colors.brown,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        'DOSC',
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                              color: Colors.brown,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold),
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
                                        'Cebu City',
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                              color: Colors.brown,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        '11-29-2023',
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                              color: Colors.brown,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
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
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
            );

          case 1:
            
          case 2:
            var screenSize = MediaQuery.of(context).size;
            return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            // height: 100,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: screenSize.width / 5,
                                  width: screenSize.width / 3.8,
                                  child: FloatingActionButton(
                                      backgroundColor: Colors.white70,
                                      onPressed: () {}),
                                ),
                                SizedBox(
                                  height: screenSize.width / 5,
                                  width: screenSize.width / 3.8,
                                  child: FloatingActionButton(
                                      backgroundColor: Colors.white70,
                                      onPressed: () {}),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }

  Future<void> _shopInfo(BuildContext context) {

    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Shop Info'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Shop-ID: ',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Shop-1',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Address 1: ',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Mandaue City',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Address 2: ',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Liloan',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Notes',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'No Notes',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Remark',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Good Remarks',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),

            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }

  _searchBar(BuildContext context){
    return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    
                    Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        // height: 50,
                        // width: 500,

                        child: SearchAnchor(
                            viewSurfaceTintColor: Colors.white70,
                            viewBackgroundColor: Colors.white70,
                            builder: (BuildContext context,
                                SearchController controller) {
                              return SearchBar(
                                controller: controller,
                                padding:
                                    const MaterialStatePropertyAll<EdgeInsets>(
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
                            suggestionsBuilder: (BuildContext context,
                                SearchController controller) {
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
                  ],
                ),
              ),
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
