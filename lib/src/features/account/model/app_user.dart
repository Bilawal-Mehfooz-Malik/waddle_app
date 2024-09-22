class AppUser {
  String? id;
  String name;
  String email;

  AppUser({
    this.id,
    required this.name,
    required this.email,
  });

  // This will be used while storing data in firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  // This will be used when we get data from firestore
  factory AppUser.fromMap(Map<String, dynamic> data, String documentId) {
    return AppUser(
      id: documentId,
      name: data['name'],
      email: data['email'],
    );
  }
}
