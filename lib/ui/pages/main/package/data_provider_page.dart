import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/data_provider_item.dart';
import 'data_package_page.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({Key? key}) : super(key: key);

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  bool selectedOperator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beli Data',
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
            'From Wallet',
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
                  Text(
                    // state.data.cardNumber!.replaceAllMapped(
                    //     RegExp(r".{4}"), (match) => "${match.group(0)} "),
                    'cardNumber',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'data name',
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
            'Select Provider',
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
                  setState(() {
                    selectedOperator = !selectedOperator;
                  });
                },
                child: DataProviderItem(
                  isSelected: selectedOperator,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          if (selectedOperator != false)
            CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataPackagePage(),
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
