import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../models/usermodel.dart';
import '../models/productmodel.dart';

mixin ConnectedProducts on Model {
  List<ProductModel> _products = [];
  int _selProductIndex;
  UserModel _authenticatedUser;

  void addProduct(
      String title, String description, String image, double price) {
    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image':
          'https://www.seriouseats.com/2018/04/20180410-milk-chocolates-vicky-wasik-1-1500x1125.jpg',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id
    };

    http
        .post('https://course-project-5555.firebaseio.com/products.json',
            body: json.encode(productData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      final ProductModel newProduct = ProductModel(
        id: responseData['name'],
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id,
      );
      _products.add(newProduct);
      notifyListeners();
    });
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

  void fetchProducts() {
    http
        .get('https://course-project-5555.firebaseio.com/products.json')
        .then((http.Response response) {
      final List<ProductModel> fetchedProductList = [];
      final Map<String, dynamic> productListData = json.decode(response.body);

      productListData.forEach((String productId, dynamic productData) {
        final ProductModel product = ProductModel(
          id: productId,
          title: productData['title'],
          description: productData['description'],
          image: productData['image'],
          price: productData['price'],
          userEmail: productData['userEmail'],
          userId: productData['userId'],
        );

        fetchedProductList.add(product);
      });
      _products = fetchedProductList;
      notifyListeners();
    });
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
