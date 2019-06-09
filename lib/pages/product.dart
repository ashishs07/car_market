import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return WillPopScope( 
      onWillPop: () {
        Navigator.pop(context,false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Image.network('https://i.imgur.com/ya2MzNP.jpg'),
            Image.asset(imageUrl),
            Text(title),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Delete this Product'),
                  onPressed: () => Navigator.pop(context, true),
                ),
                RaisedButton(
                  child: Text('Go Back'),
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
