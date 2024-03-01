// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserOrdersHash() => r'84d51da386d7e99cfb0f504e333338a542d60337';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getUserOrders].
@ProviderFor(getUserOrders)
const getUserOrdersProvider = GetUserOrdersFamily();

/// See also [getUserOrders].
class GetUserOrdersFamily extends Family<AsyncValue<List<OrderModel>>> {
  /// See also [getUserOrders].
  const GetUserOrdersFamily();

  /// See also [getUserOrders].
  GetUserOrdersProvider call({
    required String token,
  }) {
    return GetUserOrdersProvider(
      token: token,
    );
  }

  @override
  GetUserOrdersProvider getProviderOverride(
    covariant GetUserOrdersProvider provider,
  ) {
    return call(
      token: provider.token,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserOrdersProvider';
}

/// See also [getUserOrders].
class GetUserOrdersProvider
    extends AutoDisposeFutureProvider<List<OrderModel>> {
  /// See also [getUserOrders].
  GetUserOrdersProvider({
    required String token,
  }) : this._internal(
          (ref) => getUserOrders(
            ref as GetUserOrdersRef,
            token: token,
          ),
          from: getUserOrdersProvider,
          name: r'getUserOrdersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserOrdersHash,
          dependencies: GetUserOrdersFamily._dependencies,
          allTransitiveDependencies:
              GetUserOrdersFamily._allTransitiveDependencies,
          token: token,
        );

  GetUserOrdersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final String token;

  @override
  Override overrideWith(
    FutureOr<List<OrderModel>> Function(GetUserOrdersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserOrdersProvider._internal(
        (ref) => create(ref as GetUserOrdersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<OrderModel>> createElement() {
    return _GetUserOrdersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserOrdersProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserOrdersRef on AutoDisposeFutureProviderRef<List<OrderModel>> {
  /// The parameter `token` of this provider.
  String get token;
}

class _GetUserOrdersProviderElement
    extends AutoDisposeFutureProviderElement<List<OrderModel>>
    with GetUserOrdersRef {
  _GetUserOrdersProviderElement(super.provider);

  @override
  String get token => (origin as GetUserOrdersProvider).token;
}

String _$getOrderDetailHash() => r'50c5dc01c262c3faca3e52eac20d2428e9951b9b';

/// See also [getOrderDetail].
@ProviderFor(getOrderDetail)
const getOrderDetailProvider = GetOrderDetailFamily();

/// See also [getOrderDetail].
class GetOrderDetailFamily extends Family<AsyncValue<OrderModel>> {
  /// See also [getOrderDetail].
  const GetOrderDetailFamily();

  /// See also [getOrderDetail].
  GetOrderDetailProvider call({
    required String id,
  }) {
    return GetOrderDetailProvider(
      id: id,
    );
  }

  @override
  GetOrderDetailProvider getProviderOverride(
    covariant GetOrderDetailProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getOrderDetailProvider';
}

/// See also [getOrderDetail].
class GetOrderDetailProvider extends AutoDisposeFutureProvider<OrderModel> {
  /// See also [getOrderDetail].
  GetOrderDetailProvider({
    required String id,
  }) : this._internal(
          (ref) => getOrderDetail(
            ref as GetOrderDetailRef,
            id: id,
          ),
          from: getOrderDetailProvider,
          name: r'getOrderDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOrderDetailHash,
          dependencies: GetOrderDetailFamily._dependencies,
          allTransitiveDependencies:
              GetOrderDetailFamily._allTransitiveDependencies,
          id: id,
        );

  GetOrderDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<OrderModel> Function(GetOrderDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOrderDetailProvider._internal(
        (ref) => create(ref as GetOrderDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OrderModel> createElement() {
    return _GetOrderDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrderDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOrderDetailRef on AutoDisposeFutureProviderRef<OrderModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetOrderDetailProviderElement
    extends AutoDisposeFutureProviderElement<OrderModel>
    with GetOrderDetailRef {
  _GetOrderDetailProviderElement(super.provider);

  @override
  String get id => (origin as GetOrderDetailProvider).id;
}

String _$orderApiHash() => r'c0bd442926cbead4b92d5893772161fccc64c6df';

/// See also [OrderApi].
@ProviderFor(OrderApi)
final orderApiProvider =
    AutoDisposeAsyncNotifierProvider<OrderApi, void>.internal(
  OrderApi.new,
  name: r'orderApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$orderApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderApi = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
