
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_cubit_app/models/user_model.dart';

void main() {
	group('UserModel', () {
		test('can be instantiated', () {
			final user = UserModel(id: '1', email: 'test@example.com');
			expect(user, isA<UserModel>());
		});

		test('serialization to JSON', () {
			final user = UserModel(id: '1', email: 'test@example.com');
			final json = user.toJson();
			expect(json, {'id': '1', 'email': 'test@example.com'});
		});

		test('deserialization from JSON', () {
			final json = {'id': '1', 'email': 'test@example.com'};
			final user = UserModel.fromJson(json);
			expect(user.id, '1');
			expect(user.email, 'test@example.com');
		});

		test('copyWith method', () {
			final user = UserModel(id: '1', email: 'test@example.com');
			final updatedUser = user.copyWith(email: 'new@example.com');
			expect(updatedUser.id, '1');
			expect(updatedUser.email, 'new@example.com');
		});
	});
}
