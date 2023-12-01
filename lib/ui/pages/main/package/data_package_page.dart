import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/forms.dart';
import '../../../widgets/package_item.dart';

class DataPackagePage extends StatefulWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  bool selectedDataPlan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
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
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: '+628',
            isShowTitle: false,
            controller: phoneController,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDataPlan = !selectedDataPlan;
                  });
                },
                child: PackageItem(
                  isSelected: selectedDataPlan,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 85,
          ),
          if (selectedDataPlan != false || phoneController.text.isNotEmpty)
            CustomFilledButton(
              title: 'Continue',
              onPressed: () async {
                if (await Navigator.pushNamed(context, '/pin') == true) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/data-success',
                    (route) => false,
                  );
                }
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
