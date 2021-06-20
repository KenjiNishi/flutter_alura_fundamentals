import 'package:course2_sqflite/screens/contacts_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContactsList()));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.amber,
                height: 80,
                width: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.people,
                      color: Colors.black,
                      size: 38,
                    ),
                    Text(
                      'Contacts',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
