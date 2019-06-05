import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image.network('https://i.imgur.com/ya2MzNP.jpg'),
              Image.asset(imageUrl),
              Text(title),
              RaisedButton(
                child: Text('Delete this Page'),
                onPressed: () => Navigator.pop(context,true),
              ),
            ],
          ),
        ));
  }
}
