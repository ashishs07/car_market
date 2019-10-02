import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/productmodel.dart';
import '../scoped-models/main_smodel.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/car.jpg',
  };
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget _buildTitletextField(ProductModel product) {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is Required';
        }
        if (value.length <= 5) {
          return 'Title should be greater than 5 chars';
        }
      },
      initialValue: product == null ? '' : product.title,
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptiontextField(ProductModel product) {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter Description';
        }
        if (value.length <= 10) {
          return 'Description should be greater than 5 chars';
        }
      },
      initialValue: product == null ? '' : product.description,
      decoration: InputDecoration(labelText: 'Description'),
      maxLines: 5,
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPricetextField(ProductModel product) {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter Price';
        }
      },
      initialValue: product == null ? '' : product.price.toString(),
      decoration: InputDecoration(labelText: 'Price'),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm(
      Function addProduct, Function updateProduct, Function setSelectedProduct,
      [int selectedIndex]) {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    if (selectedIndex == null) {
      addProduct(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['price'],
      );
    } else {
      updateProduct(
        _formData['title'],
        _formData['description'],
        _formData['price'],
        _formData['image'],
      );
    }

    Navigator.pushReplacementNamed(context, '/home')
        .then((_) => setSelectedProduct(null));
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return RaisedButton(
        color: Theme.of(context).accentColor,
        child: Text('Save'),
        onPressed: () => _submitForm(model.addProduct, model.updateProduct,
            model.selectProduct, model.selectedProductIndex),
      );
    });
  }

  Widget _buildPageContent(BuildContext context, ProductModel product) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
	    Text('Added Text'),
            _buildTitletextField(product),
            _buildDescriptiontextField(product),
            _buildPricetextField(product),
            SizedBox(
              height: 10.0,
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Widget pageContent = _buildPageContent(
          context,
          model.selectedProduct,
        );
        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Page'),
                ),
                body: pageContent,
              );
      },
    );
  }
}
