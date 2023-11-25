import 'dart:async';

import 'package:family_budget/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rxdart/rxdart.dart';

import '../styles/app_colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.textController,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.color = Colors.transparent,
    this.onChange,
    this.onComplete,
    this.onTap,
    this.formKey,
    this.maxLines = 1,
    this.readOnly = true,
    this.enableFocus = false,
    this.suffix,
    this.prefix,
    this.width,
    this.height,
    this.radius = 6,
    this.textLength,
    this.textInputFormatter,
    this.obscureText,
    this.autofillHints,
    this.textInputAction,
    this.padding,
    this.onTapOutside,
    this.hintStyle,
    required this.colorBorder,
    this.textInputType,
    this.inputFormatter,
  }) : super(key: key);

  final TextStyle? hintStyle;
  final TextEditingController textController;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final Color? color;
  final Function(String)? onChange;
  final Function()? onComplete;
  final Function()? onTap;
  final Function()? onTapOutside;
  final GlobalKey<FormState>? formKey;
  final bool readOnly;
  final bool enableFocus;
  final int maxLines;
  final Widget? suffix;
  final Widget? prefix;
  final double? width;
  final double? height;
  final double radius;
  final double? padding;
  final Color colorBorder;
  final int? textLength;
  final TextInputFormatter? textInputFormatter;
  final bool? obscureText;
  final List<String>? autofillHints;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextInputFormatter? inputFormatter;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  MaskTextInputFormatter? _mask;

  final _errorText = BehaviorSubject.seeded('');

  Stream<String> get getErrorText => _errorText.stream;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: (widget.maxLines * 20) + (widget.padding == null ? 20 : 12),
          alignment: Alignment.center,
          width: widget.width,
          padding: EdgeInsets.symmetric(
            horizontal: widget.prefix == null ? 10 : 0,
            vertical: widget.padding ?? 8,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(
              width: 1,
              color: widget.colorBorder,
            ),
          ),
          child: Form(
            key: widget.formKey,
            child: TextFormField(
              enabled: true,
              textAlignVertical: widget.prefix != null || widget.suffix != null
                  ? TextAlignVertical.center
                  : null,
              inputFormatters: [
                if (widget.inputFormatter != null) widget.inputFormatter!,
                if (_mask != null) _mask!,
                if (widget.textLength != null)
                  LengthLimitingTextInputFormatter(widget.textLength!),
                if (widget.textInputFormatter != null)
                  widget.textInputFormatter!,
              ],
              keyboardType: widget.textInputType,
              autofillHints: widget.autofillHints,
              textInputAction: widget.textInputAction,
              maxLines: widget.maxLines,
              controller: widget.textController,
              focusNode: widget.focusNode,
              style: Theme.of(context).textTheme.bodyMedium!,
              readOnly: !widget.readOnly,
              autofocus: widget.enableFocus,
              cursorColor: AppColors.subText,
              onEditingComplete: widget.onComplete,
              obscureText: widget.obscureText ?? false,
              onChanged: (text) {
                setState(() {
                  if (widget.onChange != null) {
                    widget.onChange!(text);
                  }
                });
              },
              decoration: InputDecoration(
                suffixIconConstraints:
                    BoxConstraints(minHeight: 16, minWidth: 16),
                fillColor: widget.color,
                filled: widget.color != null ? true : false,
                label: widget.labelText != null
                    ? Text(
                        widget.labelText!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : null,
                alignLabelWithHint: widget.labelText == null,
                errorStyle: const TextStyle(
                  fontSize: 0,
                  height: 0,
                ),
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                        ),
                isDense: true,
                hoverColor: Colors.transparent,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                suffixIcon: widget.suffix,
                prefixIcon: widget.prefix,
                suffix: widget.textLength != null
                    ? Text(
                        '${widget.textController.text.length.toString()}/${widget.textLength}',
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
        StreamBuilder<String>(
          stream: getErrorText,
          initialData: '',
          builder: (context, snapshot) {
            return snapshot.data!.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      snapshot.data!,
                      style: AppTextStyles.textStyle16w400,
                    ),
                  );
          },
        ),
      ],
    );
  }
}
