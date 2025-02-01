import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthDetailScreen extends StatefulWidget {
  const AuthDetailScreen({
    super.key,
    required this.login,
    required this.pass,
    required this.onAuthCompleted,
  });

  final String login;
  final String pass;
  final Function() onAuthCompleted;

  @override
  State<AuthDetailScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthDetailScreen> {
  final List<Currency> currencies = Currency.values;
  Currency? curCurrency;

  @override
  void initState() {
    _balanceController.text = '0';
    curCurrency = Currency.rub;
    _currencyController.text = curCurrency!.value;
    super.initState();
  }

  final _balanceController = TextEditingController();
  final _currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      statusBarPadding: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  AuthEvent.initial(
                    authType: AuthType.register,
                    login: widget.login,
                    pass: widget.pass,
                  ),
                );
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: const Text(
          'Регистрация',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      willPop: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'Начальный баланс',
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
            ),
            AppTextField(
              textController: _balanceController,
              colorBorder: AppColors.colorScheme.primary,
            ),
            Text(
              'Валюта',
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
            ),
            AppTextField(
              textController: _currencyController,
              readOnly: true,
              colorBorder: AppColors.colorScheme.primary,
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        currencies.length,
                        (index) => SizedBox(
                          child: InkWell(
                            onTap: () {
                              curCurrency = currencies[index];
                              _currencyController.text = curCurrency!.value;
                              setState(() {});
                            },
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
                                    Text(currencies[index].value),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          110,
                                      child: Text(
                                        currencies[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
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
            AppButton(
              title: 'Продолжить',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthEvent.auth(
                        authType: AuthType.register,
                        login: widget.login,
                        pass: widget.pass,
                        balance: double.tryParse(_balanceController.text) ?? 0,
                        currency: _currencyController.text,
                        onAuthCompleted: widget.onAuthCompleted,
                      ),
                    );
              },
              height: 39,
              gradientColors: const [
                AppColors.complementaryBlue,
                AppColors.primary,
                AppColors.primary,
                AppColors.complementaryBlue
              ],
              radius: 10,
            )
          ],
        ),
      ),
    );
  }
}
