import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

final Profile _profile = Profile(id: 'test id');

void main() {
  test('get current', () async {
    final ProfileRepository profileRepository = MockProfileRepository();
    final ProfileInteractor profileInteractor =
        ProfileInteractor(profileRepository: profileRepository);

    when(() => profileRepository.getCurrent())
        .thenAnswer((_) async => _profile);

    final Profile actual = await profileInteractor.getCurrent();

    expect(actual, _profile);

    verify(() => profileRepository.getCurrent()).called(1);
    verifyNoMoreInteractions(profileRepository);
  });
}
