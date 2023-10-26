part of '../salon_edit_profile_page.dart';

class OwnerDetails extends StatelessWidget {
  const OwnerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<SalonEditProfilePageCubit>();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, top: 32),
          child: RichText(
            text: const TextSpan(
              text: Strings.ownerDetails,
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
        BlocBuilder<SalonEditProfilePageCubit, SalonEditProfilePageState>(
          buildWhen: (previousState, state) {
            return state is OwnerDetailsListUpdated;
          },
          builder: (context, state) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              prototypeItem: OwnerDetailsListItem(cubit, 0),
              itemCount: cubit.salonInfo.ownerDetailsList.length,
              itemBuilder: (BuildContext context, int index) {
                return OwnerDetailsListItem(cubit, index);
              },
            );
          },
        ),
        TextButton(
          onPressed: () {
            cubit.addNewOwner();
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.inputFieldBackground,
            fixedSize: const Size(42, 46),
          ),
          child: const Icon(
            Icons.add_rounded,
            size: 32,
          ),
        ),
      ],
    );
  }
}

class OwnerDetailsListItem extends StatelessWidget {
  final SalonEditProfilePageCubit cubit;
  final int index;

  OwnerDetailsListItem(this.cubit, this.index, {super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = cubit.salonInfo.ownerDetailsList[index].name;
    var url = cubit.salonInfo.ownerProfilePictureUrls.elementAtOrNull(index);
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: 12,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<SalonEditProfilePageCubit,
                    SalonEditProfilePageState>(
                  buildWhen: (previousState, state) {
                    return state is OwnerPhotoSelected && state.index == index;
                  },
                  builder: (context, state) {
                    return CircleAvatar(
                      backgroundImage: _getBackgroundImage(state, url),
                      radius: 40,
                    );
                  },
                ),
              ),
              Positioned(
                top: 70,
                left: 67,
                child: GestureDetector(
                  onTap: () {
                    cubit.setOwnerPhoto(index);
                  },
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintStyle: TextStyleConstants.textFieldHint,
                    hintText: Strings.name,
                  ),
                  onChanged: (name) {
                    cubit.salonInfo.ownerDetailsList[index].name = name;
                  },
                ),
                if (index > 0) _getCloseButton(cubit, index),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCloseButton(SalonEditProfilePageCubit cubit, int index) {
    return SizedBox(
      height: 108,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            cubit.removeOwner(index);
          },
          child: Icon(
            Icons.close_rounded,
            size: 22,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  ImageProvider<Object>? _getBackgroundImage(SalonEditProfilePageState state,
      String? url,) {
    if (state is OwnerPhotoSelected) {
      return FileImage(state.profilePicture);
    } else if (url != null && url.isNotEmpty) {
      return NetworkImage(url);
    } else {
      return const AssetImage(Assets.userProfileDummy);
    }
  }
}
