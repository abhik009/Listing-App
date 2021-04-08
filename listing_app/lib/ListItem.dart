import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Function onClick;
  final Color color;
  final String id;
  final String name;
  final String category;
  final String shgID;

  ListItem(
      {this.onClick,
      this.color,
      this.id,
      this.name,
      this.category,
      this.shgID});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: color,
        margin: EdgeInsets.only(left: 6, top: 8, right: 6, bottom: 0),
        child: Container(
          margin: EdgeInsets.only(left: 6, right: 6),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.attach_file,
                      size: 20,
                      color: Colors.black87,
                    ),
                    Icon(
                      Icons.account_balance,
                      size: 18,
                      color: Colors.deepOrangeAccent,
                    ),
                    Text("  " + id,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                            fontFamily: 'comforta')),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontFamily: 'comforta',
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('CATEGORY: ' + category,
                        style: TextStyle(
                            fontFamily: 'comforta',
                            color: Colors.black,
                            fontSize: 10.0)),
                    Text('SHG ID: ' + shgID,
                        style: TextStyle(
                            fontFamily: 'comforta',
                            color: Colors.black,
                            fontSize: 10.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
