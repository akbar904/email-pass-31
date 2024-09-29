
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/main.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('MyApp Widget', () {
		testWidgets('should contain LoginScreen widget', (WidgetTester tester) async {
			await tester.pumpWidget(const MyApp());
			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});

	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'Initial state should be Unauthenticated',
			build: () => authCubit,
			verify: (_) => expect(authCubit.state, isA<Unauthenticated>()),
		);

		blocTest<AuthCubit, AuthState>(
			'Emits Authenticated when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [isA<Authenticated>()],
		);

		blocTest<AuthCubit, AuthState>(
			'Emits Unauthenticated when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [isA<Unauthenticated>()],
		);
	});
}
