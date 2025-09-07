import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:vii/src/features/authentication/model/user_model.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get current user
  User? get currentUser => _firebaseAuth.currentUser;

  // Streaming user's status
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  //Google sign in
  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential result = await _firebaseAuth.signInWithCredential(
        credential,
      );

      // return user model
      return UserModel.fromFirebaseUser(result.user);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message ?? 'An error occurred');
    } catch (e) {
      throw AuthException("unknown", e.toString());
    }
  }

  // Apple Sign In
  Future<UserModel?> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final UserCredential result = await _firebaseAuth.signInWithCredential(
        oauthCredential,
      );

      // Update display name if provided by Apple
      if (appleCredential.givenName != null ||
          appleCredential.familyName != null) {
        final displayName =
            '${appleCredential.givenName ?? ''} ${appleCredential.familyName ?? ''}'
                .trim();
        if (displayName.isNotEmpty) {
          await result.user?.updateDisplayName(displayName);
          await result.user?.reload();
        }
      }

      return UserModel.fromFirebaseUser(result.user);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message ?? 'An error occurred');
    } catch (e) {
      throw AuthException('unknown', e.toString());
    }
  }

  // Delete Account
  Future<void> deleteAccount() async {
    try {
      await currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message ?? 'An error occurred');
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
    } catch (e) {
      throw AuthException('unknown', e.toString());
    }
  }
}

// Custom Exception Class
class AuthException implements Exception {
  final String code;
  final String message;

  AuthException(this.code, this.message);

  @override
  String toString() => message;
}
