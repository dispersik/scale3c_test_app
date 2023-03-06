class Profile {
  final String id;

  final String? name;
  final String? cityName;
  final String? imageUrl;
  final String? phoneNumber;
  final String? email;
  final int? numberOfCompletedProjects;

  Profile({
    required this.id,
    this.name,
    this.email,
    this.cityName,
    this.imageUrl,
    this.numberOfCompletedProjects,
    this.phoneNumber,
  });
}
