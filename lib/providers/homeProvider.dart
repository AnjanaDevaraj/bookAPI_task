import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/BookListResponse.dart';
import '../network/apiConstants.dart';
import '../network/apiService.dart';
import '../utilites/customSnackbar.dart';

class HomeProvider extends ChangeNotifier {
  final ApiService apiService;

  HomeProvider({required Dio dio}) : apiService = ApiService(dio);

  final TextEditingController searchController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  List<Book> bookList = [];
  bool isLoading = true;

  String? selectedUnit = "Kg";

  Future<void> getHomeData() async
  {
    final Map<String, dynamic> map = {
      "product_name": searchController.text ?? "",
    };

    try {
      final response = await apiService.post(ApiConstants.productList, map);
      BookListResponse bookListResponse =
      BookListResponse.fromJson(response.data);
      if (bookListResponse.books?.isNotEmpty ?? false) {
        bookList = bookListResponse.books ?? [];
        isLoading = false;
        notifyListeners();
      } else {
       // warningMessage("No data found");
      }
    } catch (e) {
     // errorMessage(e.toString());
    }
  }

  void clearText() {
    searchController.text = "";
    notifyListeners();
    getHomeData();
  }

  void clearAll() {
    isLoading = true;
    searchController.text = "";
    bookList.clear();
    notifyListeners();
  }

  // void increaseCount(BuildContext context,int index, Products product) {
  //   productsList[index].quantity = productsList[index].quantity + 1;
  //   notifyListeners();
  //   Provider.of<CartProvider>(context,listen: false).updateCart(product);
  // }
  //
  // void decreaseCount(BuildContext context, int index, Products product) {
  //   productsList[index].quantity == 0
  //       ? null
  //       : productsList[index].quantity = productsList[index].quantity - 1;
  //   notifyListeners();
  //   Provider.of<CartProvider>(context,listen: false).updateCart(product);
  // }

  void setDropDown(String value, int index) {
    // selectedUnit = value;
    // bookList[index].unit = value;
    // notifyListeners();
  }


  void clearFields() {
    quantityController.text = "";
    selectedUnit = "Kg";
    notifyListeners();
  }
}
