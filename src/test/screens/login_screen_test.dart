
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/screens/login_screen.dart';

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display LoginForm widget', (WidgetTester tester) async {
			// Arrange & Act
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			// Assert
			expect(find.byType(LoginForm), findsOneWidget);
		});

		testWidgets('should display title "Login"', (WidgetTester tester) async {
			// Arrange & Act
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			// Assert
			expect(find.text('Login'), findsOneWidget);
		});
	});
}
