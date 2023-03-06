import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Profile> getCurrent() async {
    final fb.User? fbAuthUser = fb.FirebaseAuth.instance.currentUser;

    if (fbAuthUser == null) {
      throw Exception('Error while fetching fb user');
    } else {
      return fbAuthUser.toDomain();
    }
  }
}

extension _ProfileFbMapper on fb.User {
  Profile toDomain() {
    return Profile(
      id: uid,
      phoneNumber: phoneNumber,
      email: email,
      name: displayName,
      imageUrl: photoURL,
      // todo(dispersik): add firestore to handle additional data
      numberOfCompletedProjects: null,
      // todo(dispersik): add firestore to handle additional data
      cityName: null,
    );
  }
}
