import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/theme.dart';
import '../../../widgets/buttons.dart';

class TopupAmountPage extends StatefulWidget {
  const TopupAmountPage({Key? key}) : super(key: key);

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          symbol: '',
          decimalDigits: 0,
        ).format(
          int.tryParse(text.replaceAll('.', '')) ?? 0,
        ),
      );
    });
  }

  validateAmount() {
    try {
      int.parse(amountController.text.replaceAll('.', ''));
    } catch (e) {
      amountController.text = '0';
    }
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
      validateAmount();
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 116,
          ),
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                'Total Amount',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const SizedBox(
              height: 67,
            ),
            Align(
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  controller: amountController,
                  cursorColor: greyColor,
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Text(
                      'Rp ',
                      style: whiteTextStyle.copyWith(
                        fontSize: 36,
                        fontWeight: medium,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 66,
            ),
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 40,
              runSpacing: 40,
              children: [
                CustomInputButton(
                  title: '1',
                  onTap: () {
                    addAmount('1');
                  },
                ),
                CustomInputButton(
                  title: '2',
                  onTap: () {
                    addAmount('2');
                  },
                ),
                CustomInputButton(
                  title: '3',
                  onTap: () {
                    addAmount('3');
                  },
                ),
                CustomInputButton(
                  title: '4',
                  onTap: () {
                    addAmount('4');
                  },
                ),
                CustomInputButton(
                  title: '5',
                  onTap: () {
                    addAmount('5');
                  },
                ),
                CustomInputButton(
                  title: '6',
                  onTap: () {
                    addAmount('6');
                  },
                ),
                CustomInputButton(
                  title: '7',
                  onTap: () {
                    addAmount('7');
                  },
                ),
                CustomInputButton(
                  title: '8',
                  onTap: () {
                    addAmount('8');
                  },
                ),
                CustomInputButton(
                  title: '9',
                  onTap: () {
                    addAmount('9');
                  },
                ),
                CustomInputButton(
                  title: '0',
                  onTap: () {
                    addAmount('0');
                  },
                ),
                GestureDetector(
                  onTap: () {
                    deleteAmount();
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: numberBackgroundColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            CustomFilledButton(
              title: 'Checkout Now',
              onPressed: () async {
                if (await Navigator.pushNamed(context, '/pin') == true) {
                  await launchUrl(Uri.parse('https://demo.midtrans.com/'));

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/topup-success',
                    (route) => false,
                  );
                }
              },
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextButton(
              title: 'Terms & Conditions',
              onPressed: () {},
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
