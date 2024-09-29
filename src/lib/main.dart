
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_screen.dart';
import 'cubits/auth_cubit.dart';
import 'cubits/auth_state.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (context) => AuthCubit(),
			child: MaterialApp(
				title: 'Simple Cubit App',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: const LoginScreen(),
			),
		);
	}
}
