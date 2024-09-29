
import 'package:flutter/material.dart';
import 'package:simple_cubit_app/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
	const LoginScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Login'),
			),
			body: const Center(
				child: LoginForm(),
			),
		);
	}
}
