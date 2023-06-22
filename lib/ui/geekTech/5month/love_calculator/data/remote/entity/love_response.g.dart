// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'love_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoveResponse _$LoveResponseFromJson(Map<String, dynamic> json) => LoveResponse(
      fname: json['fname'] as String,
      sname: json['sname'] as String,
      percentage: json['percentage'] as String,
      result: json['result'] as String,
    );

Map<String, dynamic> _$LoveResponseToJson(LoveResponse instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'sname': instance.sname,
      'percentage': instance.percentage,
      'result': instance.result,
    };
