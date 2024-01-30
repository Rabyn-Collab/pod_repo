// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginAuthHash() => r'4001e23d614708a3f2ab042ef5d832036da53cbe';

/// See also [LoginAuth].
@ProviderFor(LoginAuth)
final loginAuthProvider =
    AutoDisposeAsyncNotifierProvider<LoginAuth, UserModel>.internal(
  LoginAuth.new,
  name: r'loginAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginAuth = AutoDisposeAsyncNotifier<UserModel>;
String _$signUpAuthHash() => r'e7a8d62a127d1b70340d4da03814861bb4778562';

/// See also [SignUpAuth].
@ProviderFor(SignUpAuth)
final signUpAuthProvider =
    AutoDisposeAsyncNotifierProvider<SignUpAuth, void>.internal(
  SignUpAuth.new,
  name: r'signUpAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signUpAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUpAuth = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
