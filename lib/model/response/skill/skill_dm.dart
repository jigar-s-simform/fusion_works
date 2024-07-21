import 'package:json_annotation/json_annotation.dart';

part 'skill_dm.g.dart';

@JsonSerializable()
class SkillDm {
  SkillDm({
    required this.id,
    this.stype,
    this.category,
    this.level,
    this.skill,
    this.status,
    this.user,
    this.approvedBy,
    this.rejectedBy,
    this.comment,
  });

  factory SkillDm.fromJson(Map<String, dynamic> json) =>
      _$SkillDmFromJson(json);
  final int id;
  final String? stype;
  final String? category;
  final String? level;
  final String? skill;
  final String? status;
  final int? user;
  final int? approvedBy;
  final int? rejectedBy;
  final String? comment;

  Map<String, dynamic> toJson() => _$SkillDmToJson(this);
}
