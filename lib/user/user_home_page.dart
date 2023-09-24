import 'package:flutter/material.dart';
import '../utils/index.dart';

part 'widgets/salon_hub_toolbar.dart';

part 'widgets/filter_bottom_sheet.dart';

part 'widgets/filter_floating_action_button.dart';

part 'widgets/salon_list_view.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, null),
      body: const SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SalonListView(),
            ),
          ],
        ),
      ),
      floatingActionButton: getFilterFloatingButton(context),
    );
  }
}
