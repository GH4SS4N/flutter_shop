import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/DB/userRequests.dart';
import 'package:flutter_shop/item.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'CDropdownMenu.dart';
import 'main.dart';

final branchProvider = StateProvider<List<ParseObject>>((ref) => null);
final roleProvider = StateProvider<List<ParseObject>>((ref) => null);

class UserPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  String phoneNumber;
  String name;
  String employeeId;
  String type;
  String password;
  String formLink;
  String formResultLink;
  String branch;

  void _actionperformed(BuildContext context, phoneNumber, name, employeeId,
      password, formLink, formResultLink) {
    if (_formKey.currentState.validate()) {
      signupEmployee(phoneNumber, name, employeeId, type, password, formLink,
              formResultLink, branch)
          .then((value) {
        print("ghdjfh  ==== " + value.toString());
      });
      print(phoneNumber +
          name +
          employeeId +
          context.read(roleSelectedProvider).state.toString() +
          password +
          formLink +
          formResultLink +
          context.read(branchSelectedProvider).state.toString());

      Navigator.of(context).pop();

      //context.read(pageProvider).state = 2;
      //createDonation(donor, program, wireNumber, amount, note);
    }
  }

  Future<void> _showMyDialog(
      context, List<ParseObject> branch, List<ParseObject> role) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('انشاء حساب موضف جديد'),
          content: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Container(
              //color: green,
              //height: 600,
              width: 700,
              child: Column(
                children: [
                  Icon(
                    Icons.person_add,
                    size: 60,
                    color: green,
                  ),
                  Row(
                    children: [
                      Text(
                        "معلومات الحسابات",
                        style: TextStyle(fontSize: 35, color: green),
                      ),
                    ],
                  ),
                  // name - phone number ==================================
                  Row(children: [
                    Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 300,
                      child: TextFormField(
                        maxLength: 10,
                        maxLengthEnforced: true,
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.phone_iphone),
                          labelText: "رقم الجوال",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "can't be empty";
                          } else if (val.contains(RegExp(r'[A-Za-z]'))) {
                            return "should have only numbers ";
                          } else if (val.length != 10) {
                            return "should have 10 numbers ";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                        // inputFormatters: [
                        //   WhitelistingTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 300,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.account_circle_sharp),
                          labelText: "اسم الموضف",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          name = value;
                        },
                        // inputFormatters: [
                        //   WhitelistingTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                  ]),
                  // imployee id num drope dpwn =============================================
                  Row(children: [
                    Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 300,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.assignment_ind),
                          labelText: "الرقم الوضيفي",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "cannot be empty";
                          } else if (val.contains(RegExp(r'[A-Za-z]'))) {
                            return "should have only numbers ";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          employeeId = value;
                        },
                        // inputFormatters: [
                        //   WhitelistingTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      // height: 70,
                      width: 300,
                      child: new CDropdown(
                        selectedState: roleSelectedProvider,
                        options: role == null
                            ? ["iuoiu", 'hghgh']
                            : role
                                .map((parsepbjec) =>
                                    parsepbjec.get("Role").toString())
                                .toList(),
                        type: 1,
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Text(
                        "كلمة المرور",
                        style: TextStyle(fontSize: 35, color: green),
                      ),
                    ],
                  ),
                  // passwords =========================================
                  Row(children: [
                    Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 300,
                      child: TextFormField(
                        //obscureText: true,
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          labelText: "كلمة المرور",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "password cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        // inputFormatters: [
                        //   WhitelistingTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 300,
                      child: TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.lock_outline),
                          labelText: "كلمة المرور",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "password cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        // inputFormatters: [
                        //   WhitelistingTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Text(
                        "التقييم",
                        style: TextStyle(fontSize: 35, color: green),
                      ),
                    ],
                  ),
                  // http reveiw and results ========================================
                  Row(children: [
                    Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 300,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.link_outlined),
                          labelText: "رابط صفحة التقييم",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          formLink = value;
                        },
                        // inputFormatters: [
                        //   WhitelistingTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 300,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.bar_chart_sharp),
                          labelText: "رابط صفحة النتائج",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          formResultLink = value;
                        },
                        // inputFormatters: [
                        //   WhitelistingTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Text(
                        "الفرع",
                        style: TextStyle(fontSize: 35, color: green),
                      ),
                    ],
                  ),
                  // branch number =============================================
                  Row(children: [
                    Expanded(
                      //color: darkgray,
                      // padding: EdgeInsets.all(10),
                      // height: 70,
                      // width: 600,
                      child: Container(
                        // height: 70,
                        child: new CDropdown(
                          selectedState: branchSelectedProvider,
                          options: branch == null
                              ? ["hjk", "hkjh"]
                              : branch
                                  .map((parsepbject) =>
                                      parsepbject.get("branch").toString())
                                  .toList(),
                          type: 2,
                        ),
                      ),
                    ),
                  ]),
                  Container(
                    height: 50,
                  ),
                  // actions ================================
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          height: 59,
                          onPressed: () {
                            _actionperformed(context, phoneNumber, name,
                                employeeId, password, formLink, formResultLink);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "اضافه",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.add, color: Colors.white)
                            ],
                          ),
                          color: green,
                        ),
                      ),
                      FlatButton(
                        height: 59,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "الغاء",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: darkgray,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }

  Future<void> _showEmployeeDialog(context) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('انشاء حساب موضف جديد'),
          content: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Container(
              //color: green,
              //height: 600,
              width: 700,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   height: 70,
                  //   width: 300,
                  //   child: Text(
                  //     'انشاء حساب موضف جديد',
                  //     style: TextStyle(fontSize: 35, color: green),
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 300,
                    child: Text(
                      "معلومات الحسابات",
                      style: TextStyle(fontSize: 35, color: green),
                    ),
                  ),
                  Icon(
                    Icons.person,
                    size: 60,
                    color: green,
                  ),

                  // name - phone number ==================================
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 300,
                    child: Text("رقم الجوال: " + "0588888888"),
                  ),
                  // Spacer(),
                  Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 300,
                      child: Text("اسم الموضف: " + "dc")),
                  // imployee id num drope dpwn =============================================
                  Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 300,
                      child: Text("الرقم الوضيفي: " + "zxc")),
                  //Spacer(),
                  Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 300,
                      child: Text("kind ")),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   height: 70,
                  //   width: 300,
                  //   child: Text(
                  //     "كلمة المرور",
                  //     style: TextStyle(fontSize: 35, color: green),
                  //   ),
                  // ),
                  // passwords =========================================
                  Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 300,
                      child: Text("كلمة المرور :" + "kjhkj")),
                  // Spacer(),
                  // Container(
                  //   //color: darkgray,
                  //   padding: EdgeInsets.all(10),
                  //   height: 40,
                  //   width: 300,
                  //   child: Text(""),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   height: 70,
                  //   width: 300,
                  //   child: Text(
                  //     "التقييم",
                  //     style: TextStyle(fontSize: 35, color: green),
                  //   ),
                  // ),
                  // http reveiw and results ========================================
                  Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 300,
                      child: Text("رابط صفحة التقييم :" + "ghfgh")),
                  //Spacer(),
                  Container(
                      //color: darkgray,
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 300,
                      child: Text("رابط صفحة النتائج :" + "zxcv")),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   height: 70,
                  //   width: 300,
                  //   child: Text(
                  //     "الفرع",
                  //     style: TextStyle(fontSize: 35, color: green),
                  //   ),
                  // ),
                  // branch number =============================================
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 300,
                    child: Text("data"),
                  ),
                  Container(
                    height: 50,
                  ),
                  // actions ================================
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          height: 59,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "اغلاق",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: darkgray,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, watch) {
    final role = watch(roleProvider).state;
    final branch = watch(branchProvider).state;

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final _pageProvider = watch(pageProvider).state;
    // TODO: implement build
    return Stack(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //color: darkgray,
                      height: 50,
                      width: 300,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          labelText: "اسم المتبرع",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        // inputFormatters: [
                        //   WhitelistingTextInputFormatter.digitsOnly
                        // ],
                      ),
                    ),
                    FlatButton(
                      height: 59,
                      onPressed: () {},
                      child: Text(
                        "بحث",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: green,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(20),
                // padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Center(
                    child: Wrap(
                      // crossAxisCount: w <= 600
                      //     ? 2
                      //     : w <= 800
                      //         ? 3
                      //         : w <= 1100
                      //             ? 4
                      //             : w <= 1500
                      //                 ? 5
                      //                 : 6,
                      children: [
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                        InkWell(
                            onTap: () {
                              _showEmployeeDialog(context);
                              print("object");
                            },
                            child: Item()),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: FloatingActionButton(
              onPressed: () {
                _showMyDialog(context, branch, role);
              },
              backgroundColor: green,
              child: Icon(Icons.add),
            ),
          ),
        )
      ],
    );
  }
}
