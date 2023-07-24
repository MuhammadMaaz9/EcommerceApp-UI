import 'package:ecommerce_app_practice/models/products_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Products>?> getdata() async {
    try {
      var url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);
      print('services : ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return productsFromJson(response.body);
      }
    } catch (e) {
      print('error : ${e.toString()}');
    }
    return null;
  }
}
