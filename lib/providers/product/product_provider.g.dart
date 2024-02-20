// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductHash() => r'6c89bd18595f7df94042dc9265d9677a571490d5';

/// See also [getProduct].
@ProviderFor(getProduct)
final getProductProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  getProduct,
  name: r'getProductProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetProductRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$productApiHash() => r'f29c99dd5c3c91d3e6e115c8b897f12348b94d98';

/// See also [productApi].
@ProviderFor(productApi)
final productApiProvider =
    AutoDisposeAsyncNotifierProvider<productApi, void>.internal(
  productApi.new,
  name: r'productApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$productApi = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
