import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String phoneNumber;
  final String userName;
  final String userImage;
  const User(
      {required this.phoneNumber,
      required this.userName,
      required this.userImage});
  @override
  List<Object> get props => [userName, userImage, phoneNumber];
}
