
import 'dart:convert';

class UserModel {
	final String id;
	final String email;

	UserModel({required this.id, required this.email});

	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'email': email,
		};
	}

	factory UserModel.fromJson(Map<String, dynamic> json) {
		return UserModel(
			id: json['id'] as String,
			email: json['email'] as String,
		);
	}

	UserModel copyWith({String? id, String? email}) {
		return UserModel(
			id: id ?? this.id,
			email: email ?? this.email,
		);
	}
}
