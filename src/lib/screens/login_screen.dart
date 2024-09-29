
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.flutter_cubit_app/widgets/login_form.dart';
import 'package:com.example.flutter_cubit_app/cubits/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Login'),
			),
			body: BlocProvider(
				create: (context) => AuthCubit(),
				child: const LoginForm(),
			),
		);
	}
}
