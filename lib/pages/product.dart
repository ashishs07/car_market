import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/UI elements/product_title.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  ProductPage(this.title, this.imageUrl, this.description);

  /* _showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This cannot be undone'),
            actions: <Widget>[
              FlatButton(
                  child: Text('Go Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text('Delete'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  }),
            ],
          );
        });
  }
*/
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(imageUrl),
            ProductTitle(title),
            Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
