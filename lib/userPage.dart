import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/item.dart';
import 'main.dart';

final programsProvider = StateProvider<List<ParseObject>>((ref) => null);

class UserPage extends ConsumerWidget {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('انشاء حساب موضف جديد'),
          content: SingleChildScrollView(
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
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      decoration: new InputDecoration(
                        suffixIcon: Icon(Icons.phone),
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
                  Spacer(),
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      decoration: new InputDecoration(
                        suffixIcon: Icon(Icons.phone),
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
                ]),
                // imployee id num drope dpwn =============================================
                Row(children: [
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      decoration: new InputDecoration(
                        suffixIcon: Icon(Icons.phone),
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
                  Spacer(),
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 300,
                    child: CDropdown(
                        selectedState: programSelectedProvider,
                        options: programs == null
                            ? null
                            : programs
                                .map((parsepbject) =>
                                    parsepbject.get("name").toString())
                                .toList()),
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
                    height: 70,
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
                  Spacer(),
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      obscureText: true,
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
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      decoration: new InputDecoration(
                        suffixIcon: Icon(Icons.phone),
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
                  Spacer(),
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      decoration: new InputDecoration(
                        suffixIcon: Icon(Icons.phone),
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
                      height: 70,
                      // child: CDropdown(),
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
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "حفظ",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: green,
                      ),
                    ),
                    FlatButton(
                      height: 59,
                      onPressed: () {},
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
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, watch) {
    final programs = watch(programsProvider).state;
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
                child: GridView.count(
                  crossAxisCount: w <= 600
                      ? 2
                      : w <= 800
                          ? 3
                          : w <= 1100
                              ? 4
                              : w <= 1500
                                  ? 5
                                  : 6,
                  children: [
                    Item(),
                    Item(),
                    Item(),
                    Item(),
                    Item(),
                    Item(),
                    Item(),
                    Item(),
                    Item()
                  ],
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
                _showMyDialog(context);
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

class CDropdown {}
