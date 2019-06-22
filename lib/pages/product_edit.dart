import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEditPage(
      {this.addProduct, this.updateProduct, this.product, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPage();
  }
}

class _ProductEditPage extends State<ProductEditPage> {
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
      initialValue: widget.product == null ? '' : widget.product['title'],
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
      initialValue: widget.product == null ? '' : widget.product['description'],
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
      initialValue:
          widget.product == null ? '' : widget.product['price'].toString(),
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
    widget.product == null
        ? widget.addProduct(_formData)
        : widget.updateProduct(widget.productIndex, _formData);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final Widget _mainForm = Container(
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
    return widget.product == null
        ? _mainForm
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Page'),
            ),
            body: _mainForm,
          );
  }
}
