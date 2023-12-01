import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransferRecentUserItem extends StatelessWidget {
  const TransferRecentUserItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(
              right: 14,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image:
                    // user.profilePicture == null || user.profilePicture!.isEmpty
                    //     ? const AssetImage(
                    //         'assets/img_profile.png',
                    //       )
                    //     : NetworkImage(user.profilePicture!) as ImageProvider,
                    AssetImage(
                  'assets/img_profile.png',
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@username',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          // if (user.verified == 1)
          Row(
            children: [
              Icon(
                Icons.check_circle,
                size: 14,
                color: greenColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Verified',
                style: greenTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}