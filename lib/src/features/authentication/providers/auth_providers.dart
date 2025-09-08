import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vii/src/features/authentication/model/user_model.dart';
import 'package:vii/src/features/authentication/services/auth_services.dart';

part 'auth_providers.g.dart';

@riverpod
AuthServices authServices(Ref ref) {
  return AuthServices();
}

// Get user status
@riverpod
Stream<User?> authStatChange(Ref ref) {
  return ref.watch(authServicesProvider).authStateChange;
}

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<UserModel?> build() async {
    final authService = ref.watch(authServicesProvider);
    final user = authService.currentUser;

    if (user == null) return null;

    return UserModel.fromFirebaseUser(user);
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();

    try {
      final authService = ref.read(authServicesProvider);
      final user = await authService.signInWithGoogle();
      state = AsyncData(user);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
