import 'package:flutter/material.dart';
import 'main.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      //width: 10,
      // height: MediaQuery.of(context).size.height * 0.5,
      elevation: 8,

      //padding: const EdgeInsets.all(10),
      child: Container(
        height: 250,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
            ),
            Icon(
              Icons.person,
              color: green,
              size: 50,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('name: xxxxx'),
                  Text('Phone: 05xxxxxxxx'),
                  Text('id num: 1xxxxx'),
                  Text("branch: xxxxxx"),
                ],
              ),
            ),
            Container(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
