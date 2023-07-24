import 'package:ecommerce_app_practice/models/products_model.dart';
import 'package:ecommerce_app_practice/services/services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxList<Products> products = <Products>[].obs;

  @override
  void onInit() {
    super.onInit();
    getdata();
  }

  getdata() async {
    final productsData = await ApiService().getdata();
    if (productsData != null) {
      products.value = productsData;
      print('data: ${products}');
    } else {
      print('no data');
    }
  }
}
