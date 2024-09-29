
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.flutter_cubit_app/cubits/auth_cubit.dart';

class LoginForm extends StatefulWidget {
	@override
	_LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
	final _formKey = GlobalKey<FormState>();
	final _emailController = TextEditingController();
	final _passwordController = TextEditingController();

	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Form(
			key: _formKey,
			child: Column(
				children: [
					TextFormField(
						key: Key('emailField'),
						controller: _emailController,
						decoration: InputDecoration(labelText: 'Email'),
						validator: (value) {
							if (value == null || value.isEmpty) {
								return 'Please enter your email';
							}
							return null;
						},
					),
					TextFormField(
						key: Key('passwordField'),
						controller: _passwordController,
						decoration: InputDecoration(labelText: 'Password'),
						obscureText: true,
						validator: (value) {
							if (value == null || value.isEmpty) {
								return 'Please enter your password';
							}
							return null;
						},
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () {
							if (_formKey.currentState!.validate()) {
								BlocProvider.of<AuthCubit>(context).login(
									_emailController.text,
									_passwordController.text,
								);
							}
						},
						child: Text('Login'),
					),
				],
			),
		);
	}
}
