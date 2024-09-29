
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_cubit_app/widgets/login_form.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';
import 'package:simple_cubit_app/cubits/auth_state.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginForm Widget Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('renders email and password TextFields and login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => mockAuthCubit,
						child: Scaffold(
							body: LoginForm(),
						),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2)); // Email and Password TextFields
			expect(find.byType(ElevatedButton), findsOneWidget); // Login Button
		});

		testWidgets('triggers login method on AuthCubit when login button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => mockAuthCubit,
						child: Scaffold(
							body: LoginForm(),
						),
					),
				),
			);

			const email = 'test@example.com';
			const password = 'password123';

			await tester.enterText(find.byKey(Key('emailField')), email);
			await tester.enterText(find.byKey(Key('passwordField')), password);
			await tester.tap(find.byType(ElevatedButton));

			verify(() => mockAuthCubit.login(email, password)).called(1);
		});

		group('LoginForm Cubit Tests', () {
			blocTest<AuthCubit, AuthState>(
				'emits [] when nothing is added',
				build: () => mockAuthCubit,
				expect: () => [],
			);

			blocTest<AuthCubit, AuthState>(
				'emits [Authenticated] when login is successful',
				build: () => mockAuthCubit,
				act: (cubit) => cubit.login('test@example.com', 'password123'),
				expect: () => [isA<Authenticated>()],
			);

			blocTest<AuthCubit, AuthState>(
				'emits [Unauthenticated] when logout is called',
				build: () => mockAuthCubit,
				act: (cubit) => cubit.logout(),
				expect: () => [isA<Unauthenticated>()],
			);
		});
	});
}
