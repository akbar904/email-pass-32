
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.flutter_cubit_app/screens/login_screen.dart';

// Mock classes
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display LoginForm widget', (WidgetTester tester) async {
			// Arrange
			final authCubit = MockAuthCubit();
			
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>.value(
						value: authCubit,
						child: const LoginScreen(),
					),
				),
			);

			// Act & Assert
			expect(find.byType(LoginForm), findsOneWidget);
		});

		testWidgets('should display "Login" text', (WidgetTester tester) async {
			// Arrange
			final authCubit = MockAuthCubit();
			
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>.value(
						value: authCubit,
						child: const LoginScreen(),
					),
				),
			);

			// Act & Assert
			expect(find.text('Login'), findsOneWidget);
		});
	});
}
