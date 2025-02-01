import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/styles/app_text_styles.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' hide colorToHex;
import 'package:google_fonts/google_fonts.dart';

void showAddCategoryBottomSheet({
  required BuildContext context,
  required Function(String name, String color, String icon) onCategoryAdded,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (context) =>
        AddCategoryBottomSheet(onCategoryAdded: onCategoryAdded),
  );
}

class AddCategoryBottomSheet extends StatefulWidget {
  final Function(String name, String color, String icon) onCategoryAdded;

  const AddCategoryBottomSheet({super.key, required this.onCategoryAdded});

  @override
  _AddCategoryBottomSheetState createState() => _AddCategoryBottomSheetState();
}

class _AddCategoryBottomSheetState extends State<AddCategoryBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  Color selectedColor = Colors.blue;
  final List<String> icons = List.generate(
      29, (index) => 'assets/icons/categories/icon_${index + 1}.svg');
  String selectedIcon = 'assets/icons/categories/icon_1.svg';

  void pickColor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Center(
          child: Text(
            "Выберите цвет",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ColorPicker(
                pickerColor: selectedColor,
                onColorChanged: (color) {
                  setState(() => selectedColor = color);
                },
                paletteType: PaletteType.hslWithHue,
                enableAlpha: false,
                showLabel: false,
              ),
              AppButton(
                title: 'Сохранить',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                onPressed: () {
                  Navigator.of(context).pop();
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
      ),
    );
  }

  void selectIcon(String icon) {
    setState(() => selectedIcon = icon);
  }

  bool validate() {
    if (_nameController.text.isEmpty) {
      showMessage(
        message: 'Заполните название!',
        type: PageState.info,
      );
      return false;
    }
    return true;
  }

  void addCategory() {
    if (_nameController.text.isEmpty || selectedIcon == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Введите название и выберите иконку")),
      );
      return;
    }
    widget.onCategoryAdded(_nameController.text, colorToHex(selectedColor), selectedIcon!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.75,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Кружок выбора цвета и иконки
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                ),
                Center(
                  child: Text(
                    'Новая категория',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.divider,
                    ),
                    child: Center(
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: pickColor,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedColor,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: selectedIcon != null
                    ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(selectedIcon!,
                      color: getIconColor(selectedColor),
                      width: 40,
                      height: 40),
                )
                    : const Icon(Icons.add,
                    color: Colors.white, size: 40),
              ),
            ),
            const SizedBox(height: 20),

            // Поле ввода названия
            AppTextField(
              textController: _nameController,
              colorBorder: AppColors.colorScheme.primary,
              textLength: 30,
              hintText: 'Введите название',
              hintStyle: AppTextStyles.textStyle16w400.copyWith(
                color: AppColors.colorScheme.primary.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: icons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final icon = icons[index];
                  return GestureDetector(
                    onTap: () => selectIcon(icon),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.surface,
                        border: Border.all(
                          color: selectedIcon == icon
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double iconSize = constraints.maxWidth - 8;
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  icon,
                                  width: iconSize,
                                  height: iconSize,
                                  fit: BoxFit.contain,
                                  color: AppColors.onSecondary,
                                ),
                              ),
                              if (selectedIcon == icon)
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: Icon(Icons.check_circle,
                                      color: AppColors.primary, size: 20),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: AppButton(
                title: 'Добавить',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                onPressed: () {
                  if(validate()) {
                    widget.onCategoryAdded(
                      _nameController.text,
                      colorToHex(selectedColor),
                      selectedIcon,
                    );
                    Navigator.of(context).pop();
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
            ),
          ],
        ),
      ),
    );
  }
}
