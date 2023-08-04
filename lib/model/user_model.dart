import 'dart:convert';

List<Person> userFromJson(String str) => List<Person>.from(
      json.decode(str).map(
            (x) => Person.fromJson(x),
          ),
    );

String userToJson(List<Person> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class Person {
  String? id;
  String? userName;
  String? mobileNumber;
  String? email;
  String? password;

  Person({
    this.id,
    this.userName,
    this.mobileNumber,
    this.email,
    this.password,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        userName: json["name"],
        mobileNumber: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": userName,
        "phone": mobileNumber,
        "email": email,
        "password": password,
      };
}
