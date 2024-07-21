import 'package:json_annotation/json_annotation.dart';

part 'skill_dm.g.dart';

@JsonSerializable()
class ListSkillDm {
  ListSkillDm({
    this.skills,
  });

  factory ListSkillDm.fromJson(Map<String, dynamic> json) {
    return _$ListSkillDmFromJson(json);
  }

  final List<SkillDm>? skills;

  Map<String, dynamic> toJson() => _$ListSkillDmToJson(this);
}

@JsonSerializable()
class SkillDm {
  SkillDm({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.stype,
    this.category,
    this.level,
    this.skill,
    this.status,
    this.comment,
  });

  factory SkillDm.fromJson(Map<String, dynamic> json) =>
      _$SkillDmFromJson(json);

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? stype;
  final String? category;
  final String? level;
  final String? skill;
  final String? status;
  final String? comment;

  Map<String, dynamic> toJson() => _$SkillDmToJson(this);
}
