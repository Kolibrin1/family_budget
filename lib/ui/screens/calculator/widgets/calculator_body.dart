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
  final secondCountController = TextEditingController();

  List<Currency> curCurrencies = [];

  Currency? first;
  Currency? second;
  double? answer;

  @override
  void initState() {
    curCurrencies = currencies;
    first = widget.first;
    second = widget.second;
    secondCountController.text =
        widget.answer != null ? '${widget.answer}' : '';
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
                padding: 4,
                prefix: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    color: AppColors.button,
                  ),
                ),
                hintText: 'Поиск',
                hintStyle: AppTextStyles.textStyle16w400.copyWith(
                  color: AppColors.colorScheme.primary.withOpacity(0.9),
                ),
                textController: currencyController,
                colorBorder: AppColors.colorScheme.primary,
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
                      color: AppColors.primary.withOpacity(0.8),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  color: AppColors.onSecondary.withOpacity(0.94),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Text(
                          first == null ? '???' : first!.value,
                          style: AppTextStyles.textStyle18w500
                              .copyWith(color: AppColors.secondary),
                        ),
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
                      Flexible(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: firstCountController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.complementaryBlue,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.complementaryBlue,
                              ),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.complementaryBlue,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.complementaryBlue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        ' = ',
                        style: AppTextStyles.textStyle18w500
                            .copyWith(color: AppColors.secondary),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          readOnly: true,
                          textAlign: TextAlign.center,
                          controller: secondCountController,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColors.primary,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColors.primary,
                                ),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColors.primary,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppColors.primary,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Text(
                          second == null ? '???' : second!.value,
                          style: AppTextStyles.textStyle18w500
                              .copyWith(color: AppColors.secondary),
                        ),
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
                gradientColors: const [
                  AppColors.complementaryBlue,
                  AppColors.primary,
                  AppColors.primary,
                  AppColors.complementaryBlue
                ],
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
              if (curCurrencies.isNotEmpty)
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
                                    color:
                                        AppColors.onSecondary.withOpacity(0.94),
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
                                                decoration: const BoxDecoration(
                                                  color: AppColors
                                                      .complementaryBlue,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
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
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  120,
                                              child: Text(
                                                curCurrencies[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (second == curCurrencies[index])
                                          Container(
                                            height: 30,
                                            width: 10,
                                            decoration: const BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
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
