part of '../user_login_page.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserLoginCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19, top: 21),
          child: Text(Strings.mobileNo, style: TextStyleConstants.textField),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 19,
            right: 19,
            top: 9,
            bottom: 11,
          ),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              cubit.phoneNumber = number.phoneNumber ?? '';
            },
            onInputValidated: (isValid) {
              cubit.isPhoneNumberValid = isValid;
            },
            initialValue: PhoneNumber(isoCode: 'IN'),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              leadingPadding: 20,
              setSelectorButtonAsPrefixIcon: true,
            ),
            textStyle: TextStyleConstants.textField,
            selectorTextStyle: TextStyleConstants.textField,
            inputDecoration: const InputDecoration(
              enabledBorder: TextFieldConstants.transparentInputBorder,
              focusedBorder: TextFieldConstants.transparentInputBorder,
              border: TextFieldConstants.transparentInputBorder,
              hintText: Strings.hintPhoneNumber,
              suffixIcon: Icon(Icons.phone),
              hintStyle: TextStyleConstants.textFieldHint,
            ),
          ),
        ),
      ],
    );
  }
}
