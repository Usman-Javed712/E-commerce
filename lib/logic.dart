import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppModel extends ChangeNotifier {
  // Shop Items
  List<dynamic> _shopItems = [
    [
      "132",
      "Airpods",
      "assets/images/airpods.png",
      "AirPods Pro are Apple's premium wireless earbuds, "
          "known for their advanced features and sleek design. "
          "They have a compact, in-ear form factor with soft, "
          "silicone tips",
      "Black",
      "White",
      "Blue",
      "200",
      "4.9",
      "79%"
    ],
    [
      "1100",
      "Macbook",
      "assets/images/mac.png",
      "The MacBook Air is Apple's ultra-thin, lightweight laptop, known for its sleek, minimalist design and powerful performance."
          " It features a unibody aluminum chassis, available in colors like Space Gray, Silver, "
          "and Gold, with a thin profile",
      "1 TB",
      "512 GB",
      "256 GB",
      "1250",
      "3.9",
      "89%"
    ],
    [
      "350",
      "Xbox 360",
      "assets/images/xbox.png",
      "The Xbox 360, launched by Microsoft in 2005, "
          "was a groundbreaking gaming console known for "
          "its powerful hardware and rich feature set. It "
          "boasted a custom triple-core CPU and ATI Xenos GPU,",
      "1 TB",
      "825 GB",
      "512 GB",
      "500",
      "4.5",
      "85%"
    ],
    [
      "1000",
      "iPhone",
      "assets/images/iphone.png",
      "The iPhone 12 is a sleek and powerful smartphone from Apple, "
          "introduced in October 2020. It features a modern, flat-edge "
          "design reminiscent of earlier iPhone models, with a durable ",
      "512 GB",
      "256 GB",
      "128 GB",
      "1100",
      "4.7",
      "75%"
    ],
  ];

  // Mobile Items
  List<dynamic> _mobileItems = [
    [
      "900",
      "iPhone 13",
      "assets/images/cover.png",
      "The iPhone 13 is a sleek and powerful smartphone from Apple, "
          "introduced in October 2020. It features a modern, flat-edge "
          "design reminiscent of earlier iPhone models, with a durable ",
      "512 GB",
      "256 GB",
      "128 GB",
      "1000",
      "4.9",
      "89%"
    ],
    [
      "800",
      "iPhone 12",
      "assets/images/iphone12.png",
      "The iPhone 12 is a sleek and powerful smartphone from Apple, "
          "introduced in October 2020. It features a modern, flat-edge "
          "design reminiscent of earlier iPhone models, with a durable ",
      "512 GB",
      "256 GB",
      "128 GB",
      "900",
      "4.9",
      "79%"
    ],
    [
      "750",
      "iPhone 11",
      "assets/images/iphone11.png",
      "The iPhone 11 is a sleek and powerful smartphone from Apple, "
          "introduced in October 2020. It features a modern, flat-edge "
          "design reminiscent of earlier iPhone models, with a durable ",
      "256 GB",
      "128 GB",
      "64 GB",
      "850",
      "4.7",
      "77%"
    ],
    [
      "1000",
      "iPhone 14",
      "assets/images/iphone.png",
      "The iPhone 14 is a sleek and powerful smartphone from Apple, "
          "introduced in October 2020. It features a modern, flat-edge "
          "design reminiscent of earlier iPhone models, with a durable ",
      "512 GB",
      "256 GB",
      "128 GB",
      "1100",
      "4.6",
      "80%"
    ],
  ];

  // Head Items
  List<dynamic> _headItems = [
    [
      "250",
      "AirPods Pro",
      "assets/images/airpodpro.png",
      "AirPods Pro are Apple's premium wireless earbuds, "
          "known for their advanced features and sleek design. "
          "They have a compact, in-ear form factor with soft, "
          "silicone tips",
      "Black",
      "White",
      "Blue",
      "300",
      "4.5",
      "81%"
    ],
    [
      "150",
      "AirPods Gen 1",
      "assets/images/airpods.png",
      "AirPods Gen 1 are Apple's premium wireless earbuds, "
          "known for their advanced features and sleek design. "
          "They have a compact, in-ear form factor with soft, "
          "silicone tips",
      "Black",
      "White",
      "Blue",
      "200",
      "4.9",
      "79%"
    ],
    [
      "350",
      "Beats",
      "assets/images/beats.png",
      "Beats headphones are a popular line of "
          "audio products known for their stylish "
          "design, deep bass, and association with high-profile music culture.",
      "Black",
      "White",
      "Blue",
      "400",
      "4.6",
      "85%"
    ],
    [
      "400",
      "AirPods Max",
      "assets/images/max.png",
      "The AirPods Max are Apple's premium over-ear "
          "wireless headphones, designed for high-quality "
          "audio and a luxurious listening experience. "
          "They feature custom acoustic design with dynamic ",
      "Black",
      "White",
      "Blue",
      "500",
      "4.1",
      "75%"
    ],
  ];

  // Cart Items
  List<dynamic> _cartItems = [];

  // Favorite Items
  List<dynamic> _favItems = [];

  List<dynamic> _priceItems = [];

  List<dynamic> _addcard = [];

  List<dynamic> _addAllList = [];





  double _discount = 30;
  double _deliveryFee = 5;
  double _totalPrice = 0;

  // Getters
  List<dynamic> get shopItems => _shopItems;
  List<dynamic> get mobileItems => _mobileItems;
  List<dynamic> get headItems => _headItems;
  List<dynamic> get cartItems => _cartItems;
  List<dynamic> get priceItems => _priceItems;
  List<dynamic> get addAllList => _addAllList;
  List<dynamic> get favtItems => _favItems;
  List<dynamic> get addcard => _addcard;

  // Methods
  void addItemToCart(String imagePath, String namePath, String pricePath) {
    _cartItems.add([imagePath, namePath, pricePath]);
    updateDataBase();
    notifyListeners();
  }


  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }


  void removeItemFromCart(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void setDiscount(double discount) {
    _discount = discount;
    notifyListeners();
    calculate();
  }

  void removeDiscount(double discount) {
    _discount = 40;
    notifyListeners();
    calculate();
  }

  void setDelivery(double delivery) {
    _deliveryFee = delivery;
    notifyListeners();
    calculate();
  }

  void removeDelivery(double delivery) {
    _deliveryFee = 5;
    notifyListeners();
    calculate();
  }

  String calculate() {
    double totalPrice = 0;
    for (var item in _priceItems) {
      totalPrice += double.parse(item);
    }
    _totalPrice = totalPrice;
    return totalPrice.toStringAsFixed(2);
  }


  String discounted() {
    if (_totalPrice == 0) {
      return _totalPrice.toStringAsFixed(2);
    }
    double priceWithDelivery = _totalPrice + _deliveryFee;
    double discountAmount = (_discount / 100) * priceWithDelivery;
    double discountedPrice = priceWithDelivery - discountAmount;
    return discountedPrice.toStringAsFixed(2);
  }


  void addItemToFav(String imagePath, String namePath, String pricePath, String description, String discount) {
    _favItems.add([imagePath, namePath, pricePath, description, discount]);
    notifyListeners();
  }

  void pricelist(String price, int index) {
    if (_priceItems.length <= index) {
      _priceItems.add(price);
    } else {
      _priceItems[index] = price;
    }
    print("my price: $_priceItems");
    notifyListeners();
  }
  void clearprice(){
    _priceItems.clear();
    notifyListeners();
  }

  void removelist(int index) {
    if (index < _priceItems.length) {
      _priceItems.removeAt(index);
    }
    notifyListeners();
    print("my price: $_priceItems");
  }

  void cardlist(String number, String name, String date, String cvv) {
    _addcard.add([number, name, date, cvv]);
    print("My list: $_addcard");
  }

  List _myOrders = [];
  final _myBox = Hive.box('myBox');

  List get myOrders => _myOrders;

  void getdata(){
    _myOrders.addAll(_cartItems);
    print("My list: $_myOrders");
  }

  void loadData() {
    _myOrders = _myBox.get("MYORDERS", defaultValue: []);
    notifyListeners();
  }

  void updateDataBase() {
    _myBox.put("MYORDERS", _myOrders);
    notifyListeners();
  }

  void clearorders(){
    _myOrders.clear();
  }




  void removeItemFromFav(int index) {
    if (index >= 0 && index < _favItems.length) {
      _favItems.removeAt(index);
      notifyListeners();
    }
  }
}
