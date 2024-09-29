
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_cubit_app/models/user.dart';

void main() {
	group('User Model Tests', () {
		test('User model should correctly serialize from JSON', () {
			final json = {
				'email': 'test@example.com',
				'password': 'testpassword'
			};

			final user = User.fromJson(json);

			expect(user.email, 'test@example.com');
			expect(user.password, 'testpassword');
		});

		test('User model should correctly deserialize to JSON', () {
			final user = User(email: 'test@example.com', password: 'testpassword');

			final json = user.toJson();

			expect(json['email'], 'test@example.com');
			expect(json['password'], 'testpassword');
		});

		test('User model should have correct equality behavior', () {
			final user1 = User(email: 'test@example.com', password: 'testpassword');
			final user2 = User(email: 'test@example.com', password: 'testpassword');
			final user3 = User(email: 'test2@example.com', password: 'testpassword');

			expect(user1, equals(user2));
			expect(user1, isNot(equals(user3)));
		});

		test('User model should have correct hashCode behavior', () {
			final user1 = User(email: 'test@example.com', password: 'testpassword');
			final user2 = User(email: 'test@example.com', password: 'testpassword');
			final user3 = User(email: 'test2@example.com', password: 'testpassword');

			expect(user1.hashCode, equals(user2.hashCode));
			expect(user1.hashCode, isNot(equals(user3.hashCode)));
		});
	});
}
