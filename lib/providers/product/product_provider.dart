import 'package:image_picker/image_picker.dart';
import 'package:podsriver/models/product.dart';
import 'package:podsriver/service/product_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';



@riverpod
Future<List<Product>> getProduct(GetProductRef ref) => ProductService.getAllProducts();


@riverpod
class productApi extends _$productApi {

  @override
  FutureOr<void> build()  {
  }


   Future<void> addProduct(
      {required String product_name,
        required String product_detail,
        required int product_price,
        required String brand,
        required String category,
        required int countInStock,
        required XFile product_image}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ProductService.addProduct(
        product_name: product_name,
        product_detail: product_detail,
        product_price: product_price,
        brand: brand,
        category: category,
        countInStock: countInStock,
        product_image: product_image));
  }



  Future<void> updateProduct(
      {required String product_name,
        required String product_detail,
        required int product_price,
        required String brand,
        required String category,
        required int countInStock,
        String? prevImage,
        XFile? product_image}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ProductService.updateProduct(
        product_name: product_name, product_detail: product_detail,
        product_image: product_image,
        prevImage: prevImage,
        product_price: product_price, brand: brand, category: category, countInStock: countInStock)); 
  }


  Future<void> removeProduct(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ProductService.removeProduct(id));
  }
  
  
}
