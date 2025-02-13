import 'package:family_budget/data/models/currency_model.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:flutter/material.dart';

class FirstLoadCurrenciesScreen extends StatefulWidget {
  const FirstLoadCurrenciesScreen({super.key});

  @override
  State<FirstLoadCurrenciesScreen> createState() => _FirstLoadCurrenciesScreenState();
}

class _FirstLoadCurrenciesScreenState extends State<FirstLoadCurrenciesScreen> {
  CurrencyModel? currency;

  // Future<void> getCurrencies() async {
  //   currency = await getIt<CurrencyRepository>().getAll();
  //   print(currency);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            currency != null ? 'true' : 'false',
          ),
          const SizedBox(
            height: 20,
          ),
          // AppButton(
          //   title: 'Загрузить',
          //   onPressed: () async {
          //     // await getCurrencies();
          //   },
          // ),
        ],
      ),
    );
  }
}
