import 'package:flutter/material.dart';
import 'main.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(9),
        elevation: 5,
        child: Container(
          width: 10,
          // height: MediaQuery.of(context).size.height * 0.5,

          padding: const EdgeInsets.all(10),
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
      ),
    );
  }
}