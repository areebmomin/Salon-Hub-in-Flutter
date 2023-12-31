part of '../edit_profile_page.dart';

class AddressTextField extends StatelessWidget {
  AddressTextField({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserEditProfilePageCubit>();

    if (cubit.state is LoadProfileData) {
      _controller.text = cubit.userProfile.address;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.address,
              style: TextStyleConstants.textField,
              children: <TextSpan>[
                TextSpan(
                  text: Strings.asterisk,
                  style: TextStyleConstants.asterisk,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              hintText: Strings.hintAddress,
              hintStyle: TextStyleConstants.textFieldHint,
              suffixIcon: Icon(Icons.location_on),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
            ),
            style: TextStyleConstants.textField,
            keyboardType: TextInputType.streetAddress,
            onChanged: (address) {
              cubit.userProfile.address = address.trim();
            },
          ),
        ),
      ],
    );
  }
}
