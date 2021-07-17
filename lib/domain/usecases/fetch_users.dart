import '../entities/entities.dart';

abstract class FetchUsers {
  Future<List<UserEntity>?> get();
}
