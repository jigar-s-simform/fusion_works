import 'package:json_annotation/json_annotation.dart';

part 'project_res_dm.g.dart';

@JsonSerializable()
class ProjectResDm {
  ProjectResDm({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.description,
    this.status,
    this.startDate,
    this.endDate,
    this.clientName,
    this.progress,
  });

  factory ProjectResDm.fromJson(Map<String, dynamic> json) =>
      _$ProjectResDmFromJson(json);
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? title;
  final String? description;
  final String? status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? clientName;
  final int? progress;

  Map<String, dynamic> toJson() => _$ProjectResDmToJson(this);
}
