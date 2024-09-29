
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit.dart';

class LoginForm extends StatelessWidget {
	const LoginForm({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final _emailController = TextEditingController();
		final _passwordController = TextEditingController();

		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Column(
				children: [
					TextField(
						key: const Key('emailField'),
						controller: _emailController,
						decoration: const InputDecoration(labelText: 'Email'),
					),
					TextField(
						key: const Key('passwordField'),
						controller: _passwordController,
						obscureText: true,
						decoration: const InputDecoration(labelText: 'Password'),
					),
					const SizedBox(height: 16.0),
					ElevatedButton(
						onPressed: () {
							final email = _emailController.text;
							final password = _passwordController.text;
							context.read<AuthCubit>().login(email, password);
						},
						child: const Text('Login'),
					),
				],
			),
		);
	}
}
