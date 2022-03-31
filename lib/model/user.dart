import 'package:equatable/equatable.dart';

class User extends Equatable{

  const User({
      required this.name,
      required this.age
    });

  final String name;
  final String age;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}