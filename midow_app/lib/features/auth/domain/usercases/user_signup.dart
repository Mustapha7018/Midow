import 'package:fpdart/fpdart.dart';
import 'package:midow_app/core/errors/failure.dart';
import 'package:midow_app/core/usecase/usecase.dart';
import 'package:midow_app/features/auth/domain/entities/user.dart';

import '../repositories/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignupParams> {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignupParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

// A simple class to pass in user data in UserSignUp usecase.
// Generic type (SuccessType) accepts only one item
class UserSignupParams {
  final String name;
  final String email;
  final String password;

  UserSignupParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
