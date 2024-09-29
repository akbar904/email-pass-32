
import 'package:bloc/bloc.dart';
import 'package:com.example.flutter_cubit_app/cubits/auth_state.dart';
import 'package:com.example.flutter_cubit_app/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		emit(AuthLoading());
		try {
			// Simulate a login process with a delay
			await Future.delayed(Duration(seconds: 1));

			// Simple validation logic for example purposes
			if (email == 'test@example.com' && password == 'password') {
				final user = UserModel(id: '1', email: email);
				emit(Authenticated(user));
			} else {
				emit(AuthError('Invalid credentials'));
			}
		} catch (e) {
			emit(AuthError('An unexpected error occurred'));
		}
	}

	void logout() async {
		emit(Unauthenticated());
	}
}
