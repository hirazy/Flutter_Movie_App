import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class User{

  const User({
      required this.name,
      required this.age
    });

  final String name;
  final String age;

  // @JsonSerializable(explicitToJson: true)
  // factory User.fromJSon({
  //   Map<String,dynamic> json
  // }): _$UserFromJson
}