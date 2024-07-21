import 'package:json_annotation/json_annotation.dart';

part 'user_res_dm.g.dart';

@JsonSerializable()
class UserResDm {
  UserResDm({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.employeeCode,
    this.dob,
    this.designation,
    this.department,
  });

  factory UserResDm.fromJson(Map<String, dynamic> json) =>
      _$UserResDmFromJson(json);

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final int? employeeCode;
  final DateTime? dob;
  final String? designation;
  final String? department;

  Map<String, dynamic> toJson() => _$UserResDmToJson(this);
}
