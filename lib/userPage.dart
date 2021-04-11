import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop/item.dart';
import 'main.dart';

class UserPage extends ConsumerWidget {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, watch) {
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
                margin: EdgeInsets.symmetric(horizontal: 80, vertical: 30),
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
                      height: 50,
                      onPressed: () {},
                      child: Text(
                        "بحث",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: green,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(20),
                // padding: EdgeInsets.all(20),
                child: GridView.count(
                  crossAxisCount: w < h ? 3 : 5,
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
