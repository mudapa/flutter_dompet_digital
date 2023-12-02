class SignUpModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? ktp;
  final String? profilePicture;

  const SignUpModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.ktp,
    this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'ktp': ktp,
      'profilePicture': profilePicture,
    };
  }

  SignUpModel copyWith({
    String? pin,
    String? ktp,
    String? profilePicture,
  }) {
    return SignUpModel(
      name: name,
      email: email,
      password: password,
      pin: pin ?? this.pin,
      ktp: ktp ?? this.ktp,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
