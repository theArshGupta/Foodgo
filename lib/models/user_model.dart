class AppUser {
  final String uid;
  final String name;
  final String email;
  final DateTime joinedAt;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.joinedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'joinedAt': joinedAt.toIso8601String(),
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      joinedAt: DateTime.parse(map['joinedAt']),
    );
  }
}
