import 'package:family_budget/helpers/enums.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/auth/bloc/auth_bloc.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_scaffold.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
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
  final _loginController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool isObscure = true;
  bool isConfirmObscure = true;

  bool validate() {
    if (_loginController.text.isEmpty ||
        _passController.text.isEmpty ||
        (widget.title == 'Регистрация' &&
            _confirmPassController.text.isEmpty)) {
      showMessage(
        message: 'Заполните все поля!',
        type: PageState.info,
      );
      return false;
    }
    if (widget.title == 'Регистрация' &&
        _passController.text != _confirmPassController.text) {
      showMessage(
        message: 'Пароли не совпадают!',
        type: PageState.error,
      );
      return false;
    }
    return true;
  }

  @override
  void initState() {
    if (widget.isError != null || widget.login != null && widget.pass != null) {
      _loginController.text = widget.login!;
      _passController.text = widget.pass!;
      _confirmPassController.text = widget.pass!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: Text(
          widget.title,
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      willPop: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: 16,
          children: [
            Text(
              'Логин',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            AppTextField(
              textController: _loginController,
              colorBorder: AppColors.colorScheme.primary,
            ),
            if (widget.isError != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Данный логин занят',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Пароль',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            AppTextField(
              padding: 4,
              textController: _passController,
              colorBorder: AppColors.colorScheme.primary,
              suffix: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: isObscure
                      ? HugeIcon(
                          icon: HugeIcons.strokeRoundedViewOffSlash,
                          color: AppColors.colorScheme.secondary,
                          size: 24.0,
                        )
                      : HugeIcon(
                          icon: HugeIcons.strokeRoundedView,
                          color: AppColors.colorScheme.secondary,
                          size: 24.0,
                        ),
                ),
              ),
              obscureText: isObscure,
            ),
            if (widget.title == 'Регистрация') ...[
              const SizedBox(
                height: 16,
              ),
              Text(
                'Подтвердите пароль',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                padding: 4,
                textController: _confirmPassController,
                colorBorder: AppColors.colorScheme.primary,
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      isConfirmObscure = !isConfirmObscure;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: isConfirmObscure
                        ? HugeIcon(
                            icon: HugeIcons.strokeRoundedViewOffSlash,
                            color: AppColors.colorScheme.secondary,
                            size: 24.0,
                          )
                        : HugeIcon(
                            icon: HugeIcons.strokeRoundedView,
                            color: AppColors.colorScheme.secondary,
                            size: 24.0,
                          ),
                  ),
                ),
                obscureText: isConfirmObscure,
              ),
            ],
            const Expanded(child: SizedBox()),
            AppButton(
              title: 'Продолжить',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              onPressed: () {
                if (validate()) {
                  context.read<AuthBloc>().add(
                        AuthDetailEvent(
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
              gradientColors: const [
                AppColors.complementaryBlue,
                AppColors.primary,
                AppColors.primary,
                AppColors.complementaryBlue
              ],
              radius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
