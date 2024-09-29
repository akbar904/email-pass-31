
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/cubits/auth_state.dart';
import 'package:my_app/models/user.dart';

void main() {
	group('AuthState', () {
		test('AuthState should be equatable', () {
			expect(AuthState(), equals(AuthState()));
		});

		test('Authenticated state should store user information', () {
			final user = User(email: 'test@example.com', password: 'password');
			final state = Authenticated(user);

			expect(state.user, user);
		});

		test('Authenticated state should be equatable', () {
			final user1 = User(email: 'test@example.com', password: 'password');
			final user2 = User(email: 'test@example.com', password: 'password');
			final state1 = Authenticated(user1);
			final state2 = Authenticated(user1);
			final state3 = Authenticated(user2);

			expect(state1, state2);
			expect(state1, state3);
		});

		test('Unauthenticated state should be equatable', () {
			expect(Unauthenticated(), equals(Unauthenticated()));
		});
	});
}
