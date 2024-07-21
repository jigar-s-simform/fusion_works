import 'package:json_annotation/json_annotation.dart';

part 'add_skill_dm.g.dart';

@JsonSerializable()
class AddSkillDm {
  AddSkillDm({
    required this.skill,
    required this.category,
    required this.level,
    required this.status,
  });

  final String skill;
  final String category;
  final String level;
  final String status;

  factory AddSkillDm.fromJson(Map<String, dynamic> json) =>
      _$AddSkillDmFromJson(json);
  Map<String, dynamic> toJson() => _$AddSkillDmToJson(this);
}
