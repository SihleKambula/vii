import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({required String uid, required String email}) = _User;

  factory User.fromFirebaseUser(dynamic user) {
    return User(uid: user.uid, email: user.email);
  }
}
