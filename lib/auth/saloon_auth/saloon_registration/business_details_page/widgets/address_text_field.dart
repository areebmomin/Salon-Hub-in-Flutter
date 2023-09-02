part of '../business_details_page.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<SaloonRegistrationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.address,
              style: TextStyleConstants.textFieldTextStyle,
              children: <TextSpan>[
                TextSpan(
                  text: Strings.asterisk,
                  style: TextStyleConstants.asteriskTextStyle,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              hintText: Strings.businessAddressHint,
              hintStyle: TextStyleConstants.textFieldHintStyle,
              suffixIcon: Icon(Icons.location_on),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: TextStyleConstants.textFieldTextStyle,
            keyboardType: TextInputType.streetAddress,
            maxLines: 3,
            onChanged: (address) {
              cubit.data.address = address.trim();
            },
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
