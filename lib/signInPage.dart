import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/userPage.dart';
import 'main.dart';

class SignInPage extends ConsumerWidget {
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

          height: 300,
          width: 400,
          child: Card(
            elevation: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    // width: MediaQuery.of(context).size.width * 0.5,
                    // padding: EdgeInsets.only(top: 60),
                    child: Text('تسجيل الدخول')),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                      color: green,
                      onPressed: () {
                        context.read(pageProvider).state = 2;
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
    );
  }
}
