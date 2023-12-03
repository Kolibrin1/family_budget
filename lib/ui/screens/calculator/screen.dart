import 'package:auto_route/annotations.dart';
import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/styles/app_text_styles.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final List<Currency> currencies = Currency.values;

  final currencyController = TextEditingController();

  final firstCountController = TextEditingController();
  final secondCountController = TextEditingController();

  List<Currency> curCurrencies = [];

  Currency? first;
  Currency? second;

  @override
  void initState() {
    curCurrencies = currencies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      willPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            children: [
              AppTextField(
                padding: 2,
                prefix: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: AppColors.colorScheme.outline,
                ),
                hintText: 'Поиск',
                hintStyle: AppTextStyles.textStyle14w400.copyWith(
                  color: AppColors.colorScheme.outline,
                ),
                textController: currencyController,
                colorBorder: AppColors.colorScheme.outline,
                onChange: (value) {
                  curCurrencies = currencies
                      .where(
                        (element) =>
                            element.value.contains(
                              value.toUpperCase(),
                            ) ||
                            element.name.toUpperCase().contains(
                                  value.toUpperCase(),
                                ),
                      )
                      .toList();
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Text(first == null ? '???' : first!.value),
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: firstCountController,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(' = '),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          width: 70,
                          child: Column(
                            children: [
                              const Text('300'),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                color: AppColors.colorScheme.primary,
                                width: 70,
                                height: 1.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Text(second == null ? '???' : second!.value),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                color: AppColors.colorScheme.onPrimary,
                title: 'Посчитать',
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          curCurrencies.length,
                          (index) => SizedBox(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    blurRadius: 20,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Text(curCurrencies[index].value),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(curCurrencies[index].name),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // CurrencyCard(),
                        ),
                      ].separateBy(
                        const SizedBox(
                          height: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
