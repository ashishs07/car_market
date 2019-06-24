import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/productmodel.dart';
import '../scoped-models/product_smodel.dart';

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

  void _submitForm(Function addProduct, Function updateProduct,
      [int selectedIndex]) {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    _globalKey.currentState.save();
    if (selectedIndex == null) {
      addProduct(
        ProductModel(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image'],
        ),
      );
    } else {
      updateProduct(
        ProductModel(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image'],
        ),
      );
    }
    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<ProductSModel>(
        builder: (BuildContext context, Widget child, ProductSModel model) {
      return RaisedButton(
        color: Theme.of(context).accentColor,
        child: Text('Save'),
        onPressed: () => _submitForm(
            model.addProduct, model.updateProduct, model.selectedProductIndex),
      );
    });
  }

  Widget _buildPageContent(BuildContext context, ProductModel product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: targetPadding,
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _globalKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductSModel>(
      builder: (BuildContext context, Widget child, ProductSModel model) {
        final Widget _mainForm = _buildPageContent(
          context,
          model.selectedProduct,
        );
        return model.selectedProductIndex == null
            ? _mainForm
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Page'),
                ),
                body: _mainForm,
              );
      },
    );
  }
}
