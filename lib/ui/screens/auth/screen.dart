import 'package:auto_route/annotations.dart';
import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';

import 'widgets/auth_body.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
    required this.onAuthCompleted,
  });

  final Function() onAuthCompleted;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  void auth(BuildContext context, AuthType authType) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AuthBodyScreen(
          authType: authType,
          onAuthCompleted: widget.onAuthCompleted,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Авторизация',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      willPop: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                // Image.asset(
                //   'assets/images/init.png',
                //   height: MediaQuery.sizeOf(context).width / 1.85,
                // ),
                SvgPicture.asset(
                  'assets/icons/init_icon.svg',
                  height: MediaQuery.sizeOf(context).width / 1.85,
                ),
                const Text(
                  "Добро пожаловать в ваш личный помощник финансов! Контролируйте свой бюджет и ваши расходы!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.onPrimary, fontSize: 19),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: AppButton(
                title: 'Войти',
                gradientColors: const [
                  AppColors.complementaryBlue,
                  AppColors.primary,
                  AppColors.primary,
                  AppColors.complementaryBlue
                ],
                radius: 10,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  auth(context, AuthType.login);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: AppButton(
                title: 'Зарегистрироваться',
                gradientColors: const [
                  AppColors.complementaryBlue,
                  AppColors.primary,
                  AppColors.primary,
                  AppColors.complementaryBlue
                ],
                radius: 10,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  auth(context, AuthType.register);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
