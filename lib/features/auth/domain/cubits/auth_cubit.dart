import 'package:bloc/bloc.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(false); // Initially not logged in

  void login() => emit(true);
  void logout() => emit(false);
}
