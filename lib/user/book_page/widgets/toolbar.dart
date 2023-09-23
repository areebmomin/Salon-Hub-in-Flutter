part of '../book_page.dart';

AppBar _appBar(BuildContext context) => AppBar(
      title: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Assets.appLogo),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: Text(
              Strings.saloonName,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: AppColors.headingTextColor,
              ),
            ),
          ),
        ],
      ),
      titleSpacing: 0,
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        color: AppColors.headingTextColor,
      ),
      elevation: 3,
      shadowColor: Colors.grey.shade200,
      iconTheme: const IconThemeData(
        color: AppColors.headingTextColor,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.aboutSaloonPage);
            },
            child: const Icon(Icons.info_outline_rounded, size: 24),
          ),
        ),
      ],
    );