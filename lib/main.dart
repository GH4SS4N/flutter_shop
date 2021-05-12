import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/DB/userRequests.dart';
import 'package:flutter_shop/signInPage.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:riverpod/riverpod.dart';
import 'userPage.dart';

void main() => runApp(ProviderScope(child: MyApp()));

const appId = "OzrokmU22cgyApcIL7XMkNvADiuxuro1B5SRJ8Yy";
const serverUrl = "https://parseapi.back4app.com/";
const clientKey = "yQXy4KHzCutNlZOtToTsRU7AsHXqMts6oPaloj58";

const Color yallow = Color.fromRGBO(255, 202, 40, 1);
const Color green = Color.fromRGBO(46, 125, 50, 1);
const Color darkgray = Color.fromRGBO(97, 97, 97, 1);
const Color gray = Color.fromRGBO(243, 243, 243, 1);
final connectionProvider = FutureProvider<Parse>(
  (ref) async => await Parse().initialize(
    appId,
    serverUrl,
    clientKey: clientKey,
    //fileDirectory: (await getExternalStorageDirectory()).path,
  ),
);

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    // TODO: implement build
    return MaterialApp(
      title: "my shop",
      theme: ThemeData(primarySwatch: Colors.green),
      home: watch(connectionProvider).when(
        data: (parse) {
          getBranch().then((value) {
            print(" branch = " + value.toString());
            context.read(branchProvider).state = value;
          });
          getEmployeeRole().then((valu) {
            print(" role = " + valu.toString());
            context.read(roleProvider).state = valu;
          });
          return MyHomePage();
        },
        loading: () =>
            Container(child: Center(child: CircularProgressIndicator())),
        error: (e, stack) {
          return Scaffold(
              body: Container(child: Center(child: Text(e.toString()))));
        },
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
    );
  }
}

final pageProvider = StateProvider<int>((ref) {
  return 1;
});

final userProvider = StateProvider<ParseUser>((ref) {
  return null;
});

class MyHomePage extends ConsumerWidget {
  //var user = ParseUser.currentUser();
  @override
  Widget build(BuildContext context, watch) {
    final _pageProvider = watch(pageProvider).state;
    final user = watch(userProvider).state;
    Widget body; // = SignInPage();

    switch (user) {
      case null:
        print('oh yeah');
        //updateReminders(context);
        body = UserPage();
        break;

      default:
        print("user =-=-=-=-=-" + user.toString());
        body = UserPage();
    }

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            leading: _pageProvider == 2
                ? IconButton(
                    onPressed: () {
                      context.read(pageProvider).state = 1;
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                : null,
            backgroundColor: yallow,
            title: Center(
              child: Text(
                'نماء',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )),
        body: body);
  }
}
