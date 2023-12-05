import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
         alignment: Alignment.center,
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(100),
          child: SizedBox(
            height: 800,
            width: 900,
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
                        width: 1300,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenSize.width / 5,
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        40, 120, 19, 1)))),
                                        child: TextFormField(
                                          // validator: (String? val) {
                                          //   return Guard.againstInvalidEmail(val, 'Email');
                                          // },
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.badge_rounded),
                                              border: InputBorder.none,
                                              hintText: "Branch ID",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey[700])),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 5,
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        40, 120, 19, 1)))),
                                        child: TextFormField(
                                          // validator: (String? val) {
                                          //   return Guard.againstInvalidEmail(val, 'Email');
                                          // },
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.house_rounded),
                                              border: InputBorder.none,
                                              hintText: "Branch name",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey[700])),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.location_on),
                                              border: InputBorder.none,
                                              hintText: "Address 1",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey[700])),
                                        ),
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
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                  Icons.location_on_outlined),
                                              border: InputBorder.none,
                                              hintText: "Address 2",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey[700])),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                  Icons.calendar_month_outlined),
                                              border: InputBorder.none,
                                              hintText: "Date Opened",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey[700])),
                                        ),
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
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.checklist_sharp),
                                              border: InputBorder.none,
                                              hintText: "Type",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey[700])),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.note_add_rounded),
                                              border: InputBorder.none,
                                              hintText: "Notes",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey[700])),
                                        ),
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
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                  Icons.edit_calendar_rounded),
                                              border: InputBorder.none,
                                              hintText: "Remark",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey[700])),
                                        ),
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
                        height: 100,
                        width: screenSize.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(40, 120, 19, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
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
