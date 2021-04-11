import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/signInPage.dart';
//import 'package:riverpod/all.dart';
import 'package:riverpod/riverpod.dart';
import 'userPage.dart';
import 'startNewUser.dart';

void main() => runApp(ProviderScope(child: MyApp()));

const Color yallow = Color.fromRGBO(255, 202, 40, 1);
const Color green = Color.fromRGBO(46, 125, 50, 1);
const Color darkgray = Color.fromRGBO(97, 97, 97, 1);
const Color gray = Color.fromRGBO(243, 243, 243, 1);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "my shop",
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
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

class MyHomePage extends ConsumerWidget {
  // void selectPage(BuildContext ctx) {
  //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
  //     return MyHomePage();
  //   }));
  // }

  @override
  Widget build(BuildContext context, watch) {
    final _pageProvider = watch(pageProvider).state;
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
        body: _pageProvider == 1 ? SignInPage() : UserPage());
  }
}
