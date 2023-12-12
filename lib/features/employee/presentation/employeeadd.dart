import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shop_ui/features/employee/presentation/employee.dart';
// import 'package:shop_ui/features/presentation/pages/home.dart';

class AddEmpPage extends StatefulWidget {
  const AddEmpPage({super.key});

  @override
  State<AddEmpPage> createState() => _AddEmpPageState();
}

class _AddEmpPageState extends State<AddEmpPage> {
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 1300,
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
                            'REGISTER EMPLOYEE',
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
                          padding: const EdgeInsets.all(5),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                              hintText: "Employee ID",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700])),
                                        ),
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
                                              prefixIcon:
                                                  const Icon(Icons.person),
                                              border: InputBorder.none,
                                              hintText: "Last name",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700])),
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.person),
                                              border: InputBorder.none,
                                              hintText: "First name",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700])),
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.person),
                                              border: InputBorder.none,
                                              hintText: "Middle name",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700])),
                                        ),
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
                                                  Icons.check_circle_rounded),
                                              border: InputBorder.none,
                                              hintText: "Status",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700])),
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(Icons
                                                  .calendar_month_outlined),
                                              border: InputBorder.none,
                                              hintText: "Date hired",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700])),
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                  Icons.attach_money_outlined),
                                              border: InputBorder.none,
                                              hintText: "Salary",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700])),
                                        ),
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
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        40, 120, 19, 1)))),
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          // validator: (String? val) {
                                          //   return Guard.againstEmptyString(
                                          //       val, 'Password');
                                          // },
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: _passwordController,
                                          obscureText: _isObscure,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.lock_open),
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700]),
                                              suffixIcon: IconButton(
                                                icon: Icon(_isObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  setState(() {
                                                    _isObscure = !_isObscure;
                                                  });
                                                },
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 5,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        40, 120, 19, 1)))),
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          // validator: (String? val) {
                                          //   return Guard.againstEmptyString(
                                          //       val, 'Password');
                                          // },
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          // controller: _passwordController,
                                          obscureText: _isObscure2,
                                          decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.lock),
                                              border: InputBorder.none,
                                              hintText: "Confirm password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700]),
                                              suffixIcon: IconButton(
                                                icon: Icon(_isObscure2
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  setState(() {
                                                    _isObscure2 = !_isObscure2;
                                                  });
                                                },
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 5,
                                    )
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          // controller: _emailController,
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                  Icons.edit_calendar_rounded),
                                              border: InputBorder.none,
                                              hintText: "Remark",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[700])),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width / 5,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: screenSize.height / 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
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
                                          if (states.contains(
                                              MaterialState.hovered)) {
                                            return Colors.red; //<-- SEE HERE
                                          }
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return const Color.fromRGBO(
                                                40, 120, 19, 1); //<-- SEE HERE
                                          }
                                          return null; // Defer to the widget's default.
                                        },
                                      ),
                                    ),
                            child: SizedBox(
                              width: screenSize.width / 4,
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
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const EmployeePage()));
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white70,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: SizedBox(
                              width: screenSize.width / 4,
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
                      const SizedBox(height: 30, child: Divider()),
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
