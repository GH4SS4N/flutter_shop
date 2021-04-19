import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/userPage.dart';
import 'main.dart';

class SignInPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  void _actionperformed(BuildContext context) {
    if (_formKey.currentState.validate()) {
      context.read(pageProvider).state = 2;
      //createDonation(donor, program, wireNumber, amount, note);
    }
  }

  @override
  Widget build(BuildContext context, watch) {
    final _pageProvider = watch(pageProvider).state;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: darkgray,
      child: Center(
        child: Container(
          //padding: EdgeInsets.symmetric(vertical: 250.0),
          //margin: EdgeInsets.symmetric(vertical: 200.0, horizontal: 500),

          height: 350,
          width: 400,
          child: Card(
            elevation: 8,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      // width: MediaQuery.of(context).size.width * 0.5,
                      // padding: EdgeInsets.only(top: 60),
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 93,
                    width: 300,
                    child: TextFormField(
                      maxLength: 10,
                      maxLengthEnforced: true,
                      keyboardType: TextInputType.number,
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
                          return "g";
                        } else if (val.contains(RegExp(r'[A-Za-z]'))) {
                          return "should have only numbers ";
                        } else if (val.length != 10) {
                          return "should have 10 numbers ";
                        } else {
                          return null;
                        }
                      },
                      // inputFormatters: [
                      //   WhitelistingTextInputFormatter.digitsOnly
                      // ],
                    ),
                  ),
                  Container(
                    //color: darkgray,
                    padding: EdgeInsets.all(10),
                    height: 93,
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
                          return "cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      // inputFormatters: [
                      //   WhitelistingTextInputFormatter.digitsOnly
                      // ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        color: green,
                        onPressed: () {
                          _actionperformed(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
