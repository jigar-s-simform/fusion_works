import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile({
    this.fullName,
    this.email,
    this.phone,
    this.designation,
    this.employeeCode,
    this.dateOfBirth,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  final String? fullName;
  final String? email;
  final String? phone;
  final List<String>? designation;
  final int? employeeCode;
  final String? dateOfBirth;

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
