// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authServicesHash() => r'43c49ee1d935cd9b8ee3bc1ee6be6f090db9c3a6';

/// See also [authServices].
@ProviderFor(authServices)
final authServicesProvider = AutoDisposeProvider<AuthServices>.internal(
  authServices,
  name: r'authServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthServicesRef = AutoDisposeProviderRef<AuthServices>;
String _$authStatChangeHash() => r'9ec0bd4617dc20bc967c124c757da27090fb456e';

/// See also [authStatChange].
@ProviderFor(authStatChange)
final authStatChangeProvider = AutoDisposeStreamProvider<User?>.internal(
  authStatChange,
  name: r'authStatChangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStatChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStatChangeRef = AutoDisposeStreamProviderRef<User?>;
String _$authControllerHash() => r'1be4b4899bb29e6e9ad8240626ea305ce247db33';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AutoDisposeAsyncNotifierProvider<AuthController, UserModel?>.internal(
      AuthController.new,
      name: r'authControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthController = AutoDisposeAsyncNotifier<UserModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
