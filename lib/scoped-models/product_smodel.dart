import 'package:scoped_model/scoped_model.dart';

import '../models/productmodel.dart';

class ProductSModel extends Model {
  List<ProductModel> _products = [];
  int _selectedProductIndex;
  bool _showFavourites = false;

  List<ProductModel> get products {
    return List.from(_products);
  }

  List<ProductModel> get displayedProducts {
    if (_showFavourites) {
      return _products
          .where((ProductModel product) => product.isFavourite)
          .toList();
    }
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

  bool get displayFavouritesOnly {
    return _showFavourites;
  }

  void addProduct(ProductModel product) {
    _products.add(product);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(ProductModel product) {
    _products[_selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
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

    notifyListeners();
    _selectedProductIndex = null;
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
  }

  void toggledisplaymode() {
    _showFavourites = !_showFavourites;
    notifyListeners();
  }
}
