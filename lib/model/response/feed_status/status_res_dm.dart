import 'package:json_annotation/json_annotation.dart';

import 'project_res_dm.dart';
import 'user_res_dm.dart';

part 'status_res_dm.g.dart';

@JsonSerializable()
class StatusResDm {
  StatusResDm({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.postDate,
    this.blockers,
    this.todayUpdate,
    this.tomorrowWork,
    this.project,
    this.user,
  });

  factory StatusResDm.fromJson(Map<String, dynamic> json) =>
      _$StatusResDmFromJson(json);

  static final List<StatusResDm> fake = [
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
    StatusResDm(
      blockers: 'none',
      todayUpdate: 'Feed',
      tomorrowWork: 'Rest',
      postDate: DateTime.now(),
      project: ProjectResDm(title: 'FusionWork'),
      user: UserResDm(fullName: 'Me'),
    ),
  ];

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final DateTime? postDate;
  final String? blockers;
  final String? todayUpdate;
  final String? tomorrowWork;
  final ProjectResDm? project;
  final UserResDm? user;

  Map<String, dynamic> toJson() => _$StatusResDmToJson(this);
}
