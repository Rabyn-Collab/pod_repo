import 'package:podsriver/models/product.dart';
import 'package:podsriver/service/product_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';






@riverpod
Future<List<Product>> getProduct(GetProductRef ref) => ProductService.getAllProducts();
