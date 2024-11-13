import 'package:fpdart/fpdart.dart';
import 'package:midow_app/features/auth/domain/entities/user.dart';

import '../../../../core/errors/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  });

  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password
  });
}