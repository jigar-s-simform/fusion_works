import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  RegisterRequest({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.employeeCode,
    required this.dob,
    required this.designation,
    required this.department,
    required this.password,
  });
  @JsonKey(name: "full_name")
  String fullName;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone_number")
  String phoneNumber;
  @JsonKey(name: "employee_code")
  int employeeCode;
  @JsonKey(name: "dob")
  String dob;
  @JsonKey(name: "designation")
  String designation;
  @JsonKey(name: "department")
  String department;
  @JsonKey(name: "password")
  String password;

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
