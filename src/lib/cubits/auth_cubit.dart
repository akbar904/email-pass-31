
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
import 'package:my_app/models/user.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(Unauthenticated());

	void login(String email, String password) {
		final user = User(email: email, password: password);
		emit(Authenticated(user));
	}

	void logout() {
		emit(Unauthenticated());
	}
}
