import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final int id;
  final String name;
  final String? username;
  final String? email;
  // final AddressEntity address;
  final String? phone;
  final String? website;
  // final CompanyEntity company;

  const UsersEntity({
    required this.id,
    required this.name,
    this.username,
    this.email,
    // required this.address,
    this.phone,
    this.website,
    // required this.company,
  });

  @override
  // TODO: implement props
  @override
  List<Object?> get props => [id, name, username, email, phone, website];
}
