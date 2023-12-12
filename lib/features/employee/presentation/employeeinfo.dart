import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/features/branch/presentation/branch.dart';
// import 'package:shop_ui/features/employee/presentation/employee.dart';
// import 'package:shop_ui/features/presentation/pages/home.dart';

class InfoEmployeePage extends StatefulWidget {
  const InfoEmployeePage({super.key});

  @override
  State<InfoEmployeePage> createState() => _InfoEmployeePageState();
}

class _InfoEmployeePageState extends State<InfoEmployeePage> {
  bool _isEnabled = false;
  final TextEditingController _employeeIdController =
      TextEditingController(text: "Employee-1");
  final TextEditingController _lnameController =
      TextEditingController(text: "Barriga");
  final TextEditingController _fnameController =
      TextEditingController(text: "Rey Mark");
  final TextEditingController _mnameController =
      TextEditingController(text: "Cajes");
  final TextEditingController _statusController =
      TextEditingController(text: "Single");
  final TextEditingController _dateController =
      TextEditingController(text: "12-11-2023");
  final TextEditingController _salaryController =
      TextEditingController(text: "10,000");
  final TextEditingController _notesController =
      TextEditingController(text: "No Notes");
  final TextEditingController _remarkController =
      TextEditingController(text: "No Remarks");

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
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BranchPage()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 50,
                    color: Colors.grey,
                  )),
            ),
            SingleChildScrollView(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: 900,
                  height: 900,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '-EMPLOYEE NAME- INFO',
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
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            40, 120, 19, 1)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(40, 120, 19, 1),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Form(
                                  key: _formKey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.badge_rounded),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Employee ID',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller:
                                                        _employeeIdController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 43,
                                              )
                                              // IconButton(
                                              //   icon: const Icon(Icons.edit),
                                              //   onPressed: () {
                                              //     setState(() {
                                              //       _isEnabled = !_isEnabled;
                                              //     });
                                              //   },
                                              // ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.person),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Last Name',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller:
                                                        _lnameController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    _isEnabled = !_isEnabled;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.person),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'First Name',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller:
                                                        _fnameController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    _isEnabled = !_isEnabled;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.person),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Middle Name',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller:
                                                        _mnameController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    _isEnabled = !_isEnabled;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.check_circle_rounded),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Status',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller:
                                                        _statusController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    _isEnabled = !_isEnabled;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .calendar_month_outlined),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Date Hired',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller: _dateController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    _isEnabled = !_isEnabled;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.attach_money_outlined),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Salary',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller:
                                                        _salaryController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    _isEnabled = !_isEnabled;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.note_add_rounded),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Notes',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller:
                                                        _notesController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    _isEnabled = !_isEnabled;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.edit_calendar_rounded),
                                              SizedBox(
                                                width: screenSize.width / 10,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Remark',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width / 5,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          40,
                                                                          120,
                                                                          19,
                                                                          1)))),
                                                  child: TextFormField(
                                                    // validator: (String? val) {
                                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                                    // },
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[700]),
                                                    controller:
                                                        _remarkController,
                                                    enabled: _isEnabled,
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  setState(() {
                                                    _isEnabled = !_isEnabled;
                                                  });
                                                },
                                              ),
                                            ],
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
                              height: 30,
                            ),
                            SizedBox(
                              width: screenSize.width / 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                            return Colors.brown;  //<-- SEE HERE
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
                                          "Save Changes",
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
                                      setState(() {
                                        _isEnabled = false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 50,
                            width: screenSize.width / 2.1,
                            child: const Divider()),
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
  }
}
