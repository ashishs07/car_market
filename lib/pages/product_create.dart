import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePage();
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
  String titleValue;
  String descriptionValue;
  double priceValue;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget _buildTitletextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is Required';
        }
        if (value.length <= 5) {
          return 'Title should be greater than 5 chars';
        }
      },
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        setState(() {
          titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptiontextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter Description';
        }
        if (value.length <= 10) {
          return 'Description should be greater than 5 chars';
        }
      },
      decoration: InputDecoration(labelText: 'Description'),
      maxLines: 5,
      onSaved: (String value) {
        setState(() {
          descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPricetextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty ||
            RegExp(r'^(?:[1-9]\d*|0)?(?:[.,]\d+)?$').hasMatch(value)) {
          return 'Enter Price';
        }
      },
      decoration: InputDecoration(labelText: 'Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': titleValue,
      'description': descriptionValue,
      'price': priceValue,
      'image': 'assets/car.jpg',
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            _buildTitletextField(),
            _buildDescriptiontextField(),
            _buildPricetextField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Save'),
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
