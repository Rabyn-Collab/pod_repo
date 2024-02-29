import 'package:shopy/models/cart_item.dart';
import 'package:shopy/providers/carts/cart_provider.dart';
import 'package:shopy/service/order_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'order_provider.g.dart';




// @riverpod
// Future<List<Product>> getProduct(GetProductRef ref) => ProductService.getAllProducts();


@riverpod
class OrderApi extends _$OrderApi {

  @override
  FutureOr<void> build()  {
  }


  Future<void> addOrder(
      {

        required List<CartItem> orderItems,
        required int totalAmount,
        required String token
      }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard( () async {
     await   OrderService.addOrder(orderItems: orderItems, totalAmount: totalAmount, token: token);
     ref.read(cartItemsProvider.notifier).clearAll();

    });
  }





}
