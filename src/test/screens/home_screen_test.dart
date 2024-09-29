
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('HomeScreen', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('should display a logout button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('should call logout when logout button is pressed', (WidgetTester tester) async {
			when(() => mockAuthCubit.logout()).thenAnswer((_) async {});

			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);

			final logoutButton = find.text('Logout');
			expect(logoutButton, findsOneWidget);

			await tester.tap(logoutButton);
			await tester.pump();

			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
