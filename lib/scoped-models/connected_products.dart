import 'package:scoped_model/scoped_model.dart';

import '../models/usermodel.dart';
import '../models/productmodel.dart';

mixin ConnectedProducts on Model {
  List<ProductModel> _products = [];
  int _selProductIndex;
  UserModel _authenticatedUser;

  void addProduct(
      String title, String description, String image, double price) {
    final ProductModel newProduct = ProductModel(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: _authenticatedUser.email,
      userId: _authenticatedUser.id,
    );
    _products.add(newProduct);
    notifyListeners();
  }
}

mixin ProductSModel on ConnectedProducts {
  bool _showFavourites = false;

  List<ProductModel> get allProducts {
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
    return _selProductIndex;
  }

  ProductModel get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  bool get displayFavouritesOnly {
    return _showFavourites;
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final ProductModel updatedProduct = ProductModel(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
    );
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
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
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
      isFavourite: newFavouriteStatus,
    );

    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    if (index != null) {
      notifyListeners();
    }
  }

  void toggledisplaymode() {
    _showFavourites = !_showFavourites;
    notifyListeners();
  }
}

mixin UserSModel on ConnectedProducts {
  void login(String email, String password) {
    _authenticatedUser =
        UserModel(id: 'sbsdbcd', email: email, password: password);
  }
}
