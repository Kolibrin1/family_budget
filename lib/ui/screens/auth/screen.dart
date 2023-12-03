import 'package:auto_route/annotations.dart';
import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        backgroundColor: AppColors.white,
      ),
      willPop: false,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 20.0, left: 30, right: 30, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/coins.svg',
                color: AppColors.colorScheme.onPrimary,
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: AppButton(
                title: 'Войти',
                color: AppColors.colorScheme.primary,
                radius: 10,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  auth(context, AuthType.login);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: AppButton(
                title: 'Зарегистрироваться',
                color: AppColors.colorScheme.primary,
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
