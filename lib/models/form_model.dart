import 'dart:io';

class UserData {
  final String name;
  final String email;
  final int age;
  final List<String> selectedServices;
  final File? profilePicture;

  const UserData({
    required this.name,
    required this.email,
    required this.age,
    required this.selectedServices,
    this.profilePicture,
  });

  UserData copyWith({
    String? name,
    String? email,
    int? age,
    List<String>? selectedServices,
    File? profilePicture,
  }) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      selectedServices: selectedServices ?? this.selectedServices,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  static const empty = UserData(
    name: '',
    email: '',
    age: 0,
    selectedServices: [],
    profilePicture: null,
  );
}
