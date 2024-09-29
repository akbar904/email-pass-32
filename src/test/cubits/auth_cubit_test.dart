
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc/bloc.dart';
import 'package:com.example.flutter_cubit_app/cubits/auth_cubit.dart';
import 'package:com.example.flutter_cubit_app/cubits/auth_state.dart';
import 'package:com.example.flutter_cubit_app/models/user_model.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, AuthInitial());
		});

		group('login', () {
			final String email = 'test@example.com';
			final String password = 'password';
			final UserModel user = UserModel(id: '1', email: email);

			blocTest<AuthCubit, AuthState>(
				'emits [AuthLoading, Authenticated] when login is successful',
				build: () => authCubit,
				act: (cubit) => cubit.login(email, password),
				expect: () => [AuthLoading(), Authenticated(user)],
			);

			blocTest<AuthCubit, AuthState>(
				'emits [AuthLoading, AuthError] when login fails',
				build: () => authCubit,
				act: (cubit) => cubit.login(email, 'wrongpassword'),
				expect: () => [AuthLoading(), AuthError('Invalid credentials')],
			);
		});

		group('logout', () {
			blocTest<AuthCubit, AuthState>(
				'emits [Unauthenticated] when logout is called',
				build: () => authCubit,
				act: (cubit) => cubit.logout(),
				expect: () => [Unauthenticated()],
			);
		});
	});
}
