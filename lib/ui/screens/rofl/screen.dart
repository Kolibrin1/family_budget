import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/data/models/currency_model.dart';
import 'package:family_budget/data/repositories/currency_repository.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:flutter/material.dart';

class RoflScreen extends StatefulWidget {
  const RoflScreen({super.key});

  @override
  State<RoflScreen> createState() => _RoflScreenState();
}

class _RoflScreenState extends State<RoflScreen> {
  CurrencyModel? currency;

  Future<void> getCurrencies() async {
    currency = await getIt<CurrencyRepository>().getAll();
    print(currency);
    setState(() {});
  }

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
          AppButton(
            title: 'Загрузить',
            onPressed: () async {
              await getCurrencies();
            },
          ),
        ],
      ),
    );
  }
}
