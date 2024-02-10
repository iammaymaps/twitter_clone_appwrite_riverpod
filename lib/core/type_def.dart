import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_appwrite_riverpod/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
