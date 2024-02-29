import 'package:dio/dio.dart';
import 'package:shopy/api.dart';
import 'package:shopy/models/cart_item.dart';
import 'package:shopy/models/product.dart';

class OrderService {
  static final _dio = Dio();

  static Future<List<Product>> getAllOrders() async {
    try {
      final response = await _dio.get(Api.getAllProducts);
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

  static Future<Product> getOrderById(String id) async {
    try {
      final response = await _dio.get(Api.crudProduct + '/$id');
      return Product.fromJson(response.data);
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

  static Future<void> addOrder(
      {

        required List<CartItem> orderItems,
        required int totalAmount,
        required String token
      }) async {
    try {

      final response = await _dio.post(Api.addOrder, data: {
        'orderItems': orderItems.map((e) => e.toJson()).toList(),
        'totalAmount': totalAmount,
      }, options: Options(
          headers: {
            'Authorization': token
          }
      ));
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }


}
