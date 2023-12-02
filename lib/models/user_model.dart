class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? username;
  final int? verified;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.username,
    this.verified,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      verified: json['verified'],
      balance: json['balance'],
      cardNumber: json['card_number'],
      pin: json['pin'],
      token: json['token'],
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? username,
    String? pin,
    int? balance,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      verified: verified,
      balance: balance ?? this.balance,
      cardNumber: cardNumber,
      pin: pin ?? this.pin,
      token: token,
    );
  }
}
