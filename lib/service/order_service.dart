import 'package:dio/dio.dart';
import 'package:shopy/api.dart';
import 'package:shopy/models/cart_item.dart';
import 'package:shopy/models/order_model.dart';

class OrderService {
  static final _dio = Dio();

  static Future<List<OrderModel>> getAllOrders(String token) async {
    try {
      final response = await _dio.get(Api.allOrder, options:  Options(
          headers: {
            'Authorization': token
          }
      ));
      return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

  static Future<OrderModel> getOrderDetail(String id, String token) async {
    try {
      final response = await _dio.get('${Api.orderDetail}/$id', options:  Options(
          headers: {
            'Authorization': token
          }
      ));
      return OrderModel.fromJson(response.data);
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

  static Future<List<OrderModel>> getUserOrder(String token) async {
    try {
      final response = await _dio.get(Api.userOrder , options:  Options(
        headers: {
          'Authorization': token
        }
      ));
      return  (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
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
