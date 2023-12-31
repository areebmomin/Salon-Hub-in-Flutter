import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/strings.dart';
import 'package:repository/auth/salon_auth/salon_login/salon_login_repository.dart';

part 'salon_login_state.dart';

class SalonLoginCubit extends Cubit<SalonLoginState> {
  SalonLoginCubit(this._salonLoginRepository) : super(Initial());

  final SalonLoginRepository _salonLoginRepository;
  var _email = '';
  var _password = '';

  set email(String email) => _email = email;

  set password(String password) => _password = password;

  Future<void> loginButtonClicked() async {
    if (state is Loading) return;

    if (!EmailValidator.validate(_email)) {
      emit(ShowToast(message: Strings.enterValidEmail));
      return;
    }

    if (_password.length < 6) {
      emit(ShowToast(message: Strings.enterValidPasscode));
      return;
    }

    emit(Loading());

    try {
      await _salonLoginRepository.loginWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      emit(Success());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(Failure());
      emit(ShowToast(message: e.message));
    }
  }

  void forgotPasscodeButtonClicked() async {
    if (!EmailValidator.validate(_email)) {
      emit(ShowToast(message: Strings.enterValidEmail));
      return;
    }

    try {
      await _salonLoginRepository.sendPasswordResetEmail(email: _email);
      emit(ShowToast(message: Strings.resetEmailLinkSent));
    } catch (e) {
      emit(ShowToast(message: e.toString()));
    }
  }
}
