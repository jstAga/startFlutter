import 'package:json_annotation/json_annotation.dart';

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

  factory LoveResponse.fromJson(Map<String, dynamic> json) => _$LoveResponseFromJson(json);

  Map<String, dynamic> toJson(LoveResponse instance) => _$LoveResponseToJson(this);
}
