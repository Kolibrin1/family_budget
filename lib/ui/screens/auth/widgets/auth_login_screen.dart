import 'package:auto_route/auto_route.dart';
import 'package:family_budget/app/app_router/app_router.dart';
import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({
    super.key,
    this.login,
    required this.title,
    this.pass,
    this.isError,
    required this.onAuthCompleted,
  });

  final String? login;
  final String? pass;
  final bool? isError;
  final String title;
  final Function() onAuthCompleted;

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  bool validate() {
    if (_loginController.text.isNotEmpty && _passController.text.isNotEmpty) {
      return true;
    }
    showMessage(
      message: 'Заплните все поля!',
      type: PageState.info,
    );
    return false;
  }

  @override
  void initState() {
    if (widget.isError != null) {
      _loginController.text = widget.login!;
      _passController.text = widget.pass!;
    }
    super.initState();
  }

  final _loginController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.push(
              const DiagramRoute(),
            );
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      willPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Логин',
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            AppTextField(
              textController: _loginController,
              colorBorder: AppColors.colorScheme.primary,
            ),
            if (widget.isError != null)
              const SizedBox(
                height: 15,
              ),
            if (widget.isError != null)
              Text(
                'Данный логин занят',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.error,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Пароль',
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            AppTextField(
              textController: _passController,
              colorBorder: AppColors.colorScheme.primary,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            AppButton(
              title: 'Продолжить',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              onPressed: () {
                if (validate()) {
                  context.read<AuthBloc>().add(
                        AuthEvent.detail(
                          authType: widget.title == 'Вход'
                              ? AuthType.login
                              : AuthType.register,
                          login: _loginController.text,
                          pass: _passController.text,
                          onAuthCompleted: widget.onAuthCompleted,
                        ),
                      );
                }
              },
              height: 39,
              color: AppColors.colorScheme.primary,
              radius: 10,
            )
          ],
        ),
      ),
    );
  }
}
