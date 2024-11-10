class AppUser {
  final String id;
  final String name;
  final int age;
  final String bio;
  final List<String> images;
  final List<String> interests;

  AppUser({
    required this.id,
    required this.name,
    required this.age,
    required this.bio,
    required this.images,
    required this.interests,
  });
}
