import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/utils/guard.dart';
// import 'package:intl/intl.dart';
// import 'package:shop_ui/features/employee/presentation/employee.dart';
// import 'package:shop_ui/features/presentation/pages/home.dart';

class AddBranchPage extends StatefulWidget {
  const AddBranchPage({super.key});

  @override
  State<AddBranchPage> createState() => _AddBranchPageState();
}

class _AddBranchPageState extends State<AddBranchPage> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // TextEditingController _dateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  // @override
  // void initState() {
  //   _dateController.text = ""; //set the initial value of text field
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 900,
            height: 800,
            child: Padding(
              padding: const EdgeInsets.all(30),
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
                            'REGISTER BRANCH',
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
                                  color: const Color.fromRGBO(40, 120, 19, 1)),
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
                                      MainAxisAlignment.spaceBetween,
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
                                            // validator: (String? val) {
                                            //   return Guard.againstInvalidEmail(val, 'Email');
                                            // },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                    Icons.badge_rounded),
                                                border: InputBorder.none,
                                                hintText: "Branch ID",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[700])),
                                            validator: (String? val) {
                                              return Guard.againstEmptyString(
                                                  val, 'Branch ID');
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
                                            // validator: (String? val) {
                                            //   return Guard.againstInvalidEmail(val, 'Email');
                                            // },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                    Icons.house_rounded),
                                                border: InputBorder.none,
                                                hintText: "Branch name",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[700])),
                                            validator: (String? val) {
                                              return Guard.againstEmptyString(
                                                  val, 'Branch Name');
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            // validator: (String? val) {
                                            //   return Guard.againstInvalidEmail(val, 'Email');
                                            // },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                    Icons.location_on),
                                                border: InputBorder.none,
                                                hintText: "Address 1",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[700])),
                                            validator: (String? val) {
                                              return Guard.againstEmptyString(
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
                                            // validator: (String? val) {
                                            //   return Guard.againstInvalidEmail(val, 'Email');
                                            // },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                    Icons.location_on_outlined),
                                                border: InputBorder.none,
                                                hintText: "Address 2",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[700])),
                                            validator: (String? val) {
                                              return Guard.againstEmptyString(
                                                  val, 'Address 2');
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            // validator: (String? val) {
                                            //   return Guard.againstInvalidEmail(val, 'Email');
                                            // },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(Icons
                                                  .calendar_month_outlined),
                                              border: InputBorder.none,
                                              hintText: "Date Opened",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700]),
                                            ),
                                           
                                            validator: (String? val) {
                                              return Guard.againstEmptyString(
                                                  val, 'Date Opened');
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
                                            // validator: (String? val) {
                                            //   return Guard.againstInvalidEmail(val, 'Email');
                                            // },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                    Icons.checklist_sharp),
                                                border: InputBorder.none,
                                                hintText: "Type",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[700])),
                                            validator: (String? val) {
                                              return Guard.againstEmptyString(
                                                  val, 'Type');
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            // validator: (String? val) {
                                            //   return Guard.againstInvalidEmail(val, 'Email');
                                            // },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                    Icons.note_add_rounded),
                                                border: InputBorder.none,
                                                hintText: "Notes",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[700])),
                                            validator: (String? val) {
                                              return Guard.againstEmptyString(
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
                                            // validator: (String? val) {
                                            //   return Guard.againstInvalidEmail(val, 'Email');
                                            // },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            // controller: _emailController,
                                            decoration: InputDecoration(
                                                prefixIcon: const Icon(Icons
                                                    .edit_calendar_rounded),
                                                border: InputBorder.none,
                                                hintText: "Remark",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[700])),
                                            validator: (String? val) {
                                              return Guard.againstEmptyString(
                                                  val, 'Remark');
                                            }),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: screenSize.width / 5,
                                    // )
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
                        height: 30,
                      ),
                      SizedBox(
                        width: screenSize.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        const Color.fromRGBO(40, 120, 19, 1)),
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
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
                              onPressed: () {},
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white70,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: SizedBox(
                                width: screenSize.width / 7,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.ptSerif(
                                      textStyle: const TextStyle(
                                        color: Color.fromRGBO(40, 120, 19, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const EmployeePage()));
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50, child: Divider()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
