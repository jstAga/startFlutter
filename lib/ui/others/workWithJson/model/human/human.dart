import 'package:json_annotation/json_annotation.dart';
import 'package:start_flutter/ui/others/workWithJson/model/address/addreses.dart';

part 'human.g.dart';

@JsonSerializable()
class Human {
  String name;
  String surname;
  int age;
  List<Address> address;

  Human(
      {required this.name,
      required this.surname,
      required this.age,
      required this.address});

  factory Human.fromJson(Map<String, dynamic> json) => _$HumanFromJson(json);

  // factory Human.fromJson(Map<String, dynamic> json) {
  //   return Human(
  //       name: json["name"] as String,
  //       surname: json["surname"] as String,
  //       age: json["age"] as int,
  //       address: (json["address"] as List<dynamic>)
  //           .map((dynamic e) => Address.fromJson(e as Map<String, dynamic>))
  //           .toList());
  // }

  Map<String, dynamic> toJson() => _$HumanToJson(this);

// Map<String,dynamic> toJson(){
//   return <String, dynamic>{
//     "name": name,
//     "surname": surname,
//     "age": age,
//     "address": address.map((e) => e.toJson()).toList()
//   };
// }
}
