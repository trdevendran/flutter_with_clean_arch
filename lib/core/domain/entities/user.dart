class User {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? birthday;
  final String? gender;
  final String? image;

  const User(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.birthday,
      this.gender,
      this.image});

  factory User.fromJson(json) {
    return User(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        phone: json['phone'],
        birthday: json['birthday'],
        gender: json['gender'],
        image: json['image']);
  }
}
