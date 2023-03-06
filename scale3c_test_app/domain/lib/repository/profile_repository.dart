import 'package:domain/domain.dart';

abstract class ProfileRepository {
  Future<Profile> getCurrent();
}