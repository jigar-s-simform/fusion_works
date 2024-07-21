import 'package:json_annotation/json_annotation.dart';

part 'dsu_list_req_dm.g.dart';

@JsonSerializable()
class DsuListReqDm {
  const DsuListReqDm({this.page = 0, this.projectId = 0});

  factory DsuListReqDm.fromJson(Map<String, dynamic> json) =>
      _$DsuListReqDmFromJson(json);

  final int? page;
  final int? projectId;

  Map<String, dynamic> toJson() => _$DsuListReqDmToJson(this);
}
