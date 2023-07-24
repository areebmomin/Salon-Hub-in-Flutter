part of '../salon_login_page.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19, top: 18),
          child: Text(
            Strings.passcode,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 19, right: 19, top: 9, bottom: 12),
          child: OTPTextField(
            length: 6,
            fieldWidth: 56,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 5,
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: AppColors.inputFieldBackground,
              borderColor: AppColors.inputFieldBackground,
              enabledBorderColor: AppColors.inputFieldBackground,
            ),
            style: const TextStyle(
              color: AppColors.headingTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            onChanged: (code) {
              context.read<SaloonLoginCubit>().password = code;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: 'msg');
            },
            child: const Text(
              Strings.forgotPasscode,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                fontFamily: Strings.firaSans,
                fontWeight: FontWeight.w500,
                color: AppColors.headingTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
