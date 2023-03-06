import 'package:domain/domain.dart';

class ProfileInteractor {
  final ProfileRepository _profileRepository;

  ProfileInteractor({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  Future<Profile> getCurrent() => _profileRepository.getCurrent();
}
