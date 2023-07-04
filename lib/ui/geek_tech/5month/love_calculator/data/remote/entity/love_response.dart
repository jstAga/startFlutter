import 'package:json_annotation/json_annotation.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/local/hive/entity/love_entity/love_entity.dart';

part 'love_response.g.dart';

@JsonSerializable()
class LoveResponse {
  final String fname;
  final String sname;
  final String percentage;
  final String result;

  LoveResponse(
      {required this.fname,
      required this.sname,
      required this.percentage,
      required this.result});

  factory LoveResponse.fromJson(Map<String, dynamic> json) =>
      _$LoveResponseFromJson(json);

  Map<String, dynamic> toJson(LoveResponse instance) =>
      _$LoveResponseToJson(this);

  LoveEntity toLoveEntity() {
    return LoveEntity(
        fname: fname,
        sname: sname,
        percentage: percentage,
        result: result);
  }
}
