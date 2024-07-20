import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    this.fullName,
    this.email,
    this.phone,
    this.designation,
    this.employeeCode,
    this.dateOfBirth,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String? fullName;
  final String? email;
  final String? phone;
  final List<String>? designation;
  final int? employeeCode;
  final String? dateOfBirth;
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
