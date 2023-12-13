import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/employee/presentation/employee.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class BranchDash extends StatefulWidget {
  const BranchDash({super.key});

  @override
  State<BranchDash> createState() => _BranchDashState();
}

class _BranchDashState extends State<BranchDash> {
  late BranchBloc _branchBloc;
  final DIContainer diContainer = DIContainer();
  @override
  void initState() {
    super.initState();
    _branchBloc = BlocProvider.of<BranchBloc>(context);
    // _branchBloc.add(GetBranchEvent());
  }

  SampleItem? selectMenu;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
              alignment: Alignment.topLeft,
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
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '-BRANCH NAME- DASHBOARD',
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
                  height: 30,
                  width: screenSize.width / 1.5,
                  child: const Divider()),
              Builder(builder: (context) {
                // final isSmallScreen = MediaQuery.of(context).size.width < 600;
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: screenSize.height / 1.3,
                      width: 1400,
                      child: ListView.builder(
                        itemCount: 10,
                        padding: const EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          width: 10,
                          margin: const EdgeInsets.only(
                              bottom: 15, right: 50, left: 50),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(40, 120, 19, 1))),
                            // borderRadius: BorderRadius.circular(20),
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5.0,
                                  offset: Offset(0, 3))
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EmployeePage()));
                              // return const InfoEmployeePage();
                              // _displayEmployee(context);
                              // Your click event code here
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const EmployeeDash()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(Icons.account_circle_rounded),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          'Emp-1',
                                          style: GoogleFonts.ptSerif(
                                            textStyle: const TextStyle(
                                                color: Colors.brown,
                                                fontSize: fontsize,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          'Last name',
                                          style: GoogleFonts.ptSerif(
                                            textStyle: const TextStyle(
                                              color: Colors.brown,
                                              fontSize: fontsize,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          'First name',
                                          style: GoogleFonts.ptSerif(
                                            textStyle: const TextStyle(
                                              color: Colors.brown,
                                              fontSize: fontsize,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          'Middle name',
                                          style: GoogleFonts.ptSerif(
                                            textStyle: const TextStyle(
                                              color: Colors.brown,
                                              fontSize: fontsize,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Text(
                                          'Status',
                                          style: GoogleFonts.ptSerif(
                                            textStyle: const TextStyle(
                                                color: Colors.brown,
                                                fontSize: fontsize,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.clip,
                                        ),
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
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Future _displayEmployee(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Form(
              child: AlertDialog(
            alignment: Alignment.topCenter,
            title: const Center(
              child: Text('Employee Details'),
            ),
            content: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Employee ID:'),
                    Text('Last name:'),
                    Text('First name:'),
                    Text('Middle name:'),
                    Text('Status:'),
                    Text('Date hired:'),
                    Text('Salary:'),
                    Text('Notes:'),
                    Text('Remark:'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Emp-1'),
                    Text('Barriga'),
                    Text('Rey Mark'),
                    Text('Cajes'),
                    Text('Single'),
                    Text('12-05-2023'),
                    Text('Php 10,000'),
                    Text('No Notes'),
                    Text('Good Remarks'),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Okay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ));
        });
  }
}

const double fontsize = 17;
