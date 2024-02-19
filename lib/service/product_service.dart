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
      required XFile product_image}) async {
    try {
      final formData = FormData.fromMap({
        'product_name': product_name,
        'product_detail': product_detail,
        'product_price': product_price,
        'brand': brand,
        'category': category,
        'countInStock': countInStock,
        'product_image': await MultipartFile.fromFile(product_image.path,
            filename: 'upload.txt'),
      });
      final response = await _dio.post(Api.addProduct, data: formData);
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
      String? prevImage,
      XFile? product_image}) async {
    try {
      if (product_image == null) {
        await _dio.patch(Api.crudProduct, data: {
          'product_name': product_name,
          'product_detail': product_detail,
          'product_price': product_price,
          'brand': brand,
          'category': category,
          'countInStock': countInStock,
        });
      } else {
        final formData = FormData.fromMap({
          'product_name': product_name,
          'product_detail': product_detail,
          'product_price': product_price,
          'brand': brand,
          'category': category,
          'countInStock': countInStock,
          'product_image': await MultipartFile.fromFile(product_image.path,
              filename: 'upload.txt'),
          'prevImage': prevImage,
        });

        await _dio.patch(Api.crudProduct, data: formData);
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
