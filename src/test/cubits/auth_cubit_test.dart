
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/cubits/auth_cubit.dart';
import 'package:my_app/cubits/auth_state.dart';
import 'package:my_app/models/user.dart';

class MockUser extends Mock implements User {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;
		late User mockUser;

		setUp(() {
			mockUser = MockUser();
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is Unauthenticated', () {
			expect(authCubit.state, equals(Unauthenticated()));
		});

		blocTest<AuthCubit, AuthState>(
			'emits [Authenticated] when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [Authenticated(mockUser)],
			verify: (_) {
				verify(() => mockUser.email).called(1);
				verify(() => mockUser.password).called(1);
			},
		);

		blocTest<AuthCubit, AuthState>(
			'emits [Unauthenticated] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [Unauthenticated()],
		);
	});
}
