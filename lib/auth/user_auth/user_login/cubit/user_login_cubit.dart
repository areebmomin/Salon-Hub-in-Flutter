import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/strings.dart';
import 'package:repository/auth/user_auth/user_login/user_login_repository.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit(this._userLoginRepository) : super(Initial()) {
    _userLoginRepository.status.listen(_loginStatusListener);
  }

  final UserLoginRepository _userLoginRepository;
  var _phoneNumber = '';
  var _otp = '';
  var _isPhoneNumberValid = false;
  var _isOtpSent = false;

  get isOtpSent => _isOtpSent;

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  set otp(String otp) => _otp = otp;

  set isPhoneNumberValid(bool isPhoneNumberValid) =>
      _isPhoneNumberValid = isPhoneNumberValid;

  void _loginStatusListener(VerifyPhoneNumberState event) {
    if (event is VerifyPhoneNumberCompleted) {
      emit(Success());
    } else if (event is VerifyPhoneNumberFailed) {
      emit(ShowToast(message: event.message));
    } else if (event is VerifyPhoneNumberCodeSent) {
      _isOtpSent = true;
      emit(OtpSent());
    } else if (event is VerifyPhoneNumberTimeout) {
      _isOtpSent = false;
      emit(OtpTimeout());
      emit(ShowToast(message: Strings.otpTimeout));
    }
  }

  void loginButtonClicked() {
    if (state is Loading) return;

    if (_isOtpSent) {
      _verifyOtp();
    } else {
      _verifyPhoneNumber();
    }
  }

  void _verifyPhoneNumber() {
    if (!_isPhoneNumberValid) {
      emit(ShowToast(message: Strings.enterValidPhoneNumber));
      return;
    }

    emit(Loading());

    // verify phone number and send OTP
    _userLoginRepository.verifyPhoneNumber(phoneNumber: _phoneNumber);
  }

  void _verifyOtp() {
    if (_otp.length < 6) {
      emit(ShowToast(message: Strings.enterValidOtp));
      return;
    }

    emit(Loading());

    // verify OTP and login user
    _userLoginRepository.signInWithCredential(smsCode: _otp);
  }

  @override
  Future<void> close() {
    _userLoginRepository.dispose();
    return super.close();
  }
}
