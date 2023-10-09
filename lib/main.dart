// ignore_for_file: avoid_print

import 'package:api_task/models/category_model.dart';
import 'package:api_task/models/product_model.dart';
import 'package:dio/dio.dart';

void main(List<String> args) async {
  ApiService api = ApiService();
  var products = await api.getData('products');
  var categories = await api.getData('categories');

  ProductModel productModel = ProductModel.fromJson(products);
  CategoryModel categoryModel = CategoryModel.fromJson(categories);

  productModel.data?.data?.forEach((element) {
    print(element.id);
  });
  print(categoryModel.data?.data);
}

class ApiService {
  static final dio = Dio();

  Future<Map<String, dynamic>> getData(String endPoint) async {
    var res = await dio.get('https://student.valuxapps.com/api/$endPoint');
    return res.data;
  }
}
