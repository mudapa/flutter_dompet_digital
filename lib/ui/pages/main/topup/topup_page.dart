import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';
import '../../../widgets/bank_item.dart';
import '../../../widgets/buttons.dart';
import 'topup_amount_page.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   state.data.cardNumber!.replaceAllMapped(
                  //       RegExp(r".{4}"), (match) => "${match.group(0)} "),
                  //   style: blackTextStyle.copyWith(
                  //     fontSize: 16,
                  //     fontWeight: medium,
                  //   ),
                  // ),
                  Text(
                    '123123 213123',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Name',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selectedPaymentMethod = paymentMethod;
                  // });
                },
                child: BankItem(
                  isSelected: true,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              // if (selectedPaymentMethod != null) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => TopupAmountPage(
              //         data: TopupFormModel(
              //           paymentMethodCode: selectedPaymentMethod?.code,
              //         ),
              //       ),
              //     ),
              //   );
              // }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TopupAmountPage(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
