import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/styles/app_text_styles.dart';
import 'package:family_budget/ui/screens/calculator/bloc/calc_bloc.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculatorBody extends StatefulWidget {
  const CalculatorBody(
      {super.key,
      this.first,
      this.second,
      this.count,
      this.answer,
      this.searchText});

  final Currency? first;
  final Currency? second;
  final double? count;
  final double? answer;
  final String? searchText;

  @override
  State<CalculatorBody> createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  final List<Currency> currencies = Currency.values;

  final currencyController = TextEditingController();

  final firstCountController = TextEditingController();

  List<Currency> curCurrencies = [];

  Currency? first;
  Currency? second;
  double? answer;

  @override
  void initState() {
    curCurrencies = currencies;
    first = widget.first;
    second = widget.second;
    answer = widget.answer;
    firstCountController.text = widget.count != null ? '${widget.count}' : '';
    currencyController.text = widget.searchText ?? '';
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
                        onTap: () {
                          if (first != null) {
                            first = null;
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: firstCountController,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                            color: AppColors.colorScheme.primary,
                          ))),
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
                              answer != null ? Text('$answer') : const Text(''),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                color: AppColors.success,
                                width: 70,
                                height: 1.3,
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
                        onTap: () {
                          if (second != null) {
                            setState(() {
                              second = null;
                            });
                          }
                        },
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
                onPressed: () {
                  if (first != null &&
                      second != null &&
                      firstCountController.text != '' &&
                      double.tryParse(firstCountController.text) != null) {
                    context.read<CalculatorBloc>().add(
                          CalculatorEvent.calculate(
                            first: first!,
                            second: second!,
                            count: double.parse(
                              firstCountController.text,
                            ),
                          ),
                        );
                  }
                },
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
                            child: InkWell(
                              onTap: () {
                                if (first == null) {
                                  first = curCurrencies[index];
                                } else if (second == null) {
                                  second = curCurrencies[index];
                                } else {
                                  if (first == curCurrencies[index]) {
                                    first = null;
                                  } else if (second == curCurrencies[index]) {
                                    second = null;
                                  } else {
                                    second = curCurrencies[index];
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 30,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (first == curCurrencies[index])
                                            Container(
                                              height: 30,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                color: AppColors
                                                    .colorScheme.primary,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                            )
                                          else
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(curCurrencies[index].value),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(curCurrencies[index].name),
                                        ],
                                      ),
                                      if (second == curCurrencies[index])
                                        Container(
                                          height: 30,
                                          width: 10,
                                          decoration: const BoxDecoration(
                                            color: AppColors.success,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                        )
                                      else
                                        const SizedBox(
                                          width: 10,
                                        ),
                                    ],
                                  ),
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
