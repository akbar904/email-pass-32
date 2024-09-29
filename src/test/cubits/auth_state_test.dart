
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_cubit_app/cubits/auth_state.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		test('initial state is AuthInitial', () {
			expect(mockAuthCubit.state, AuthInitial());
		});

		blocTest<MockAuthCubit, AuthState>(
			'emit Authenticated when login is successful',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => <AuthState>[Authenticated()],
		);

		blocTest<MockAuthCubit, AuthState>(
			'emit Unauthenticated when logout is called',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.logout(),
			expect: () => <AuthState>[Unauthenticated()],
		);
	});
}
