import 'package:start_flutter/ui/others/workWithJson/model/address/addreses.dart';
import 'package:start_flutter/ui/others/workWithJson/model/human/human.dart';

final humans = [
  Human(name: "alex", surname: "brown", age: 19, address: [
    Address(city: "Bishkek", street: "Kulieva", house: "21a", flat: 66),
    Address(city: "Bishkeke", street: "Magisral", house: "21a", flat: 66),
    Address(city: "Bishkek", street: "Kok-jar", house: "21a", flat: 66),
  ]),
  Human(name: "Sultan", surname: "Sultanov", age: 20, address: [
    Address(city: "Astana", street: "Kulieva", house: "21a", flat: 66),
    Address(city: "Astana", street: "Magisral", house: "21a", flat: 66),
    Address(city: "Almaty", street: "Kok-jar", house: "21a", flat: 66),
  ]),
];

const jsonString = '''
[
  {
      "name": "Ivan",
      "surname": "Ivanov",
      "age": 18,
      "address": [
        {
          "city": "Moscow",
          "street": "Pushkina",
          "house": "12a",
          "flat": 12
        },
        {
          "city": "Moscow",
          "street": "Pushkina",
          "house": "12a",
          "flat": 12
        }
      ]
  },
    {
      "name": "Ivan",
      "surname": "Ivanov",
      "age": 18,
      "address": [
        {
          "city": "Moscow",
          "street": "Pushkina",
          "house": "12a",
          "flat": 12
        },
        {
          "city": "Moscow",
          "street": "Pushkina",
          "house": "12a",
          "flat": 12
        }
      ]
  }
]      
''';
