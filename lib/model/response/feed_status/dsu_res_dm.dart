import 'package:fusion_works/model/response/feed_status/status_res_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dsu_res_dm.g.dart';

@JsonSerializable()
class DsuResDm {
  const DsuResDm({this.dsu});

  factory DsuResDm.fromJson(Map<String, dynamic> json) =>
      _$DsuResDmFromJson(json);

  final List<StatusResDm>? dsu;

  Map<String, dynamic> toJson() => _$DsuResDmToJson(this);
}
