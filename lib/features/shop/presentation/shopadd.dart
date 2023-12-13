import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/core/utils/guard.dart';
import 'package:shop_ui/features/shop/domain/bloc/shop_bloc.dart';
import 'package:shop_ui/features/shop/domain/models/add_shop.model.dart';
import 'package:shop_ui/features/shop/presentation/home.dart';
// import 'package:shop_ui/features/employee/presentation/employee.dart';
// import 'package:shop_ui/features/presentation/pages/home.dart';

class AddShopPage extends StatefulWidget {
  const AddShopPage({super.key});

  @override
  State<AddShopPage> createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {
  final DIContainer diContainer = DIContainer();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _shopIdController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  late ShopBloc _shopBloc;

  @override
  void initState() {
    super.initState();
    _shopBloc = BlocProvider.of<ShopBloc>(context);
  }

  void clearText() {
    _shopIdController.clear();
    _shopNameController.clear();
    _address1Controller.clear();
    _address2Controller.clear();
    _notesController.clear();
    _remarkController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocConsumer<ShopBloc, ShopState>(
      bloc: _shopBloc,
      listener: _addListener,
      builder: (context, state) {
        if (state.stateStatus == StateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: SizedBox(
                width: 900,
                height: 800,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'REGISTER SHOP',
                                style: GoogleFonts.ptSerif(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(40, 120, 19, 1),
                                      fontSize: 50,
                                      letterSpacing: .5),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 900,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(40, 120, 19, 1)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(40, 120, 19, 1),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: screenSize.width / 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      40, 120, 19, 1),
                                                ),
                                              ),
                                            ),
                                            child: TextFormField(
                                                controller: _shopIdController,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                decoration: InputDecoration(
                                                    prefixIcon: const Icon(
                                                        Icons.badge_rounded),
                                                    border: InputBorder.none,
                                                    hintText: "Shop ID",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[700])),
                                                validator: (String? val) {
                                                  return Guard
                                                      .againstEmptyShopId(
                                                          val, 'Shop ID');
                                                }),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenSize.width / 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                              bottom: BorderSide(
                                                color: Color.fromRGBO(
                                                    40, 120, 19, 1),
                                              ),
                                            )),
                                            child: TextFormField(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              controller: _shopNameController,
                                              decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                    Icons.house_rounded),
                                                border: InputBorder.none,
                                                hintText: "Shop name",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                              validator: (String? val) {
                                                return Guard.againstEmptyString(
                                                    val, 'Shop Name');
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: screenSize.width / 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      40, 120, 19, 1),
                                                ),
                                              ),
                                            ),
                                            child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                controller: _address1Controller,
                                                decoration: InputDecoration(
                                                    prefixIcon: const Icon(
                                                        Icons.location_on),
                                                    border: InputBorder.none,
                                                    hintText: "Address 1",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[700])),
                                                validator: (String? val) {
                                                  return Guard
                                                      .againstEmptyString(
                                                          val, 'Address 1');
                                                }),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenSize.width / 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            40, 120, 19, 1)))),
                                            child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                controller: _address2Controller,
                                                decoration: InputDecoration(
                                                    prefixIcon: const Icon(Icons
                                                        .location_on_outlined),
                                                    border: InputBorder.none,
                                                    hintText: "Address 2",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[700])),
                                                validator: (String? val) {
                                                  return Guard
                                                      .againstEmptyString(
                                                          val, 'Address 2');
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: screenSize.width / 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            40, 120, 19, 1)))),
                                            child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                controller: _notesController,
                                                decoration: InputDecoration(
                                                    prefixIcon: const Icon(
                                                        Icons.note_add_rounded),
                                                    border: InputBorder.none,
                                                    hintText: "Notes",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[700])),
                                                validator: (String? val) {
                                                  return Guard
                                                      .againstEmptyString(
                                                          val, 'Notes');
                                                }),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenSize.width / 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color.fromRGBO(
                                                            40, 120, 19, 1)))),
                                            child: TextFormField(
                                              validator: (String? val) {
                                                return Guard.againstEmptyString(
                                                    val, 'Remark');
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              controller: _remarkController,
                                              decoration: InputDecoration(
                                                  prefixIcon: const Icon(Icons
                                                      .edit_calendar_rounded),
                                                  border: InputBorder.none,
                                                  hintText: "Remark",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[700])),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenSize.height / 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: screenSize.width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => const Color.fromRGBO(
                                                40, 120, 19, 1)),
                                    shape: MaterialStateProperty.resolveWith(
                                        (states) => RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    overlayColor: MaterialStateProperty
                                        .resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.hovered)) {
                                          return Colors.red; //<-- SEE HERE
                                        }
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.brown; //<-- SEE HERE
                                        }
                                        return null; // Defer to the widget's default.
                                      },
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: screenSize.width / 7,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "Add",
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    _addShop(context);
                                  },
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: SizedBox(
                                    width: screenSize.width / 7,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                            color:
                                                Color.fromRGBO(40, 120, 19, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider<ShopBloc>(
                                          create: (context) =>
                                              diContainer.shopBloc,
                                          child: const HomePage(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        width: screenSize.width / 2.1,
                        child: const Divider(),
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
  }

  void _addListener(BuildContext context, ShopState state) {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.defualtSnackBar('ShopID is already taken!', context);
      clearText();
    }
    if (state.isAdded == true) {
      SnackBarUtils.defualtSnackBar('Shop Added!', context);
      clearText();
    }
  }

  void _addShop(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _shopBloc.add(
        AddShopEvent(
          addShopModel: AddShopModel(
            shopId: _shopIdController.text,
            shopName: _shopNameController.text,
            address1: _address1Controller.text,
            address2: _address2Controller.text,
            notes: _notesController.text,
            remark: _remarkController.text,
          ),
        ),
      );
    }
  }
}
