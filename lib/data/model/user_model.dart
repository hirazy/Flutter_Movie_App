// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'user_model.freezed.dart';
//
// @freezed
// class User with _$User{
//
//   const User._();
//
//   @JsonSerializable(explicitToJson: true)
//   const factory User({
//     required String name,
//     int? age,
//   }) = _User;
//
//   factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
//
//   String forFun() => name * age!;
//
// }