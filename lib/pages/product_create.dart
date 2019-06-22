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
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/car.jpg',
  };
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
        _formData['title'] = value;
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
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPricetextField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter Price';
        }
      },
      decoration: InputDecoration(labelText: 'Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    widget.addProduct(_formData);
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
