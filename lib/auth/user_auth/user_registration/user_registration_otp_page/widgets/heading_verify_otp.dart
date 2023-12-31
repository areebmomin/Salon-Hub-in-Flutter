part of '../user_registration_otp_page.dart';

class HeadingVerifyOtp extends StatelessWidget {
  const HeadingVerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 21, left: 18),
      child: Text(Strings.verifyOtp, style: TextStyleConstants.pageHeading),
    );
  }
}
