import 'package:dio/dio.dart';
import 'package:podsriver/api.dart';
import 'package:podsriver/models/product.dart';
import 'package:image_picker/image_picker.dart';

class ProductService {
  static final _dio = Dio();

  static Future<List<Product>> getAllProducts() async {
    try {
      final response = await _dio.get(Api.getAllProducts);
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

  static Future<Product> getProductById(String id) async {
    try {
      final response = await _dio.get(Api.crudProduct + '/$id');
      return Product.fromJson(response.data);
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

  static Future<void> addProduct(
      {required String product_name,
      required String product_detail,
      required int product_price,
      required String brand,
      required String category,
      required int countInStock,
      required XFile product_image,
      required String token
      }) async {
    try {
      final formData = FormData.fromMap({
        'product_name': product_name,
        'product_detail': product_detail,
        'product_price': product_price,
        'brand': brand,
        'category': category,
        'countInStock': countInStock,
        'product_image': await MultipartFile.fromFile(product_image.path,
            filename: product_image.name),
      });
      final response = await _dio.post(Api.addProduct, data: formData, options: Options(
        headers: {
          'Authorization': token
        }
      ));
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

  static Future<void> updateProduct(
      {required String product_name,
      required String product_detail,
      required int product_price,
      required String brand,
      required String category,
      required int countInStock,
        required String token,
        required String product_id,
      String? prevImage,
      XFile? product_image}) async {
    try {
      if (product_image == null) {
        await _dio.patch(Api.crudProduct + '/$product_id', data: {
          'product_name': product_name,
          'product_detail': product_detail,
          'product_price': product_price,
          'brand': brand,
          'category': category,
          'countInStock': countInStock,
        },options: Options(
            headers: {
              'Authorization': token
            }
        ));
      } else {
        final formData = FormData.fromMap({
          'product_name': product_name,
          'product_detail': product_detail,
          'product_price': product_price,
          'brand': brand,
          'category': category,
          'countInStock': countInStock,
          'product_image': await MultipartFile.fromFile(product_image.path,
              filename: product_image.name),
          'prevImage': prevImage,
        });

        await _dio.patch(Api.crudProduct+ '/$product_id', data: formData, options: Options(
            headers: {
              'Authorization': token
            }
        ));
      }
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }

  static Future<void> removeProduct(String id) async {
    try {
      final response = await _dio.delete(Api.crudProduct + '/$id');
    } on DioException catch (err) {
      throw '${err.response}';
    }
  }
}
