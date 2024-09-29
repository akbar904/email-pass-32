
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.flutter_cubit_app/widgets/logout_button.dart';

class MockAuthCubit extends MockCubit<void> implements AuthCubit {}
class FakeAuthState extends Fake implements AuthState {}

void main() {
	group('LogoutButton Widget Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		testWidgets('renders LogoutButton with correct text', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider.value(
							value: authCubit,
							child: LogoutButton(),
						),
					),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('calls logout on AuthCubit when pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider.value(
							value: authCubit,
							child: LogoutButton(),
						),
					),
				),
			);

			await tester.tap(find.byType(LogoutButton));
			await tester.pump();

			verify(() => authCubit.logout()).called(1);
		});
	});
}
