import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TransferResultUserItem extends StatelessWidget {
  const TransferResultUserItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: blueColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image:
                      // user.profilePicture == null || user.profilePicture!.isEmpty
                      //     ? const AssetImage('assets/img_profile.png')
                      //     : NetworkImage(
                      //         user.profilePicture!,
                      //       ) as ImageProvider,
                      AssetImage('assets/img_profile.png')),
            ),
            // child: user.verified == 1
            //     ? Align(
            //         alignment: Alignment.topRight,
            //         child: Container(
            //           width: 16,
            //           height: 16,
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: whiteColor,
            //           ),
            //           child: Center(
            //             child: Icon(
            //               Icons.check_circle,
            //               color: greenColor,
            //               size: 14,
            //             ),
            //           ),
            //         ),
            //       )
            //     : null,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle,
                    color: greenColor,
                    size: 14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'name',
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
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
