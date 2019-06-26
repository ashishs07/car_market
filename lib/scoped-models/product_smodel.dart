import 'package:scoped_model/scoped_model.dart';

import '../models/productmodel.dart';

class ProductSModel extends Model {
  List<ProductModel> _products = [];
  int _selectedProductIndex;

  List<ProductModel> get products {
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  ProductModel get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  void addProduct(ProductModel product) {
    _products.add(product);
    _selectedProductIndex = null;
  }

  void updateProduct(ProductModel product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
  }

  void toggleProductFavouriteStatus() {
    final bool isFavourite = selectedProduct.isFavourite;
    final bool newFavouriteStatus = !isFavourite;
    final ProductModel updatedProduct = ProductModel(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      isFavourite: newFavouriteStatus,
    );

    _products[_selectedProductIndex] = updatedProduct;
    _selectedProductIndex = null;
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
  }
}
