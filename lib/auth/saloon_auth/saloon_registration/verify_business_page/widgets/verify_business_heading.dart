part of '../verify_business_page.dart';

class VerifyBusinessHeadingWidget extends StatelessWidget {
  const VerifyBusinessHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 21, left: 18),
      child: Text(
        Strings.verifyBusiness,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: AppColors.headingTextColor,
          fontFamily: Strings.firaSans,
        ),
      ),
    );
  }
}