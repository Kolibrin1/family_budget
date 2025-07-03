import 'package:family_budget/helpers/enums.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' hide colorToHex;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:family_budget/gen/strings.g.dart';

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
    builder: (_) => AddCategoryBottomSheet(onCategoryAdded: onCategoryAdded),
  );
}

class AddCategoryBottomSheet extends StatefulWidget {
  const AddCategoryBottomSheet({super.key, required this.onCategoryAdded});

  final Function(String name, String color, String icon) onCategoryAdded;

  @override
  State<AddCategoryBottomSheet> createState() => _AddCategoryBottomSheetState();
}

class _AddCategoryBottomSheetState extends State<AddCategoryBottomSheet> {
  final _nameController = TextEditingController();
  Color _selectedColor = Colors.blue;
  String _selectedIcon = 'assets/icons/categories/icon_1.svg';
  final _icons = List.generate(29, (index) => 'assets/icons/categories/icon_${index + 1}.svg');

  void _pickColor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Center(
          child: Text(
            t.profile.enterColor,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ColorPicker(
                pickerColor: _selectedColor,
                onColorChanged: (color) => setState(() => _selectedColor = color),
                paletteType: PaletteType.hslWithHue,
                enableAlpha: false,
                showLabel: false,
              ),
              AppButton(
                title: t.profile.saveBtn,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 39,
                radius: 10,
                gradientColors: _gradientColors,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validate() {
    if (_nameController.text.isEmpty) {
      showMessage(message: t.profile.enterTitle, type: PageState.info);
      return false;
    }
    return true;
  }

  static const _gradientColors = [
    AppColors.complementaryBlue,
    AppColors.primary,
    AppColors.primary,
    AppColors.complementaryBlue,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.75,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            _buildHeader(theme),
            const SizedBox(height: 8),
            _buildColorIconSelector(),
            const SizedBox(height: 20),
            AppTextField(
              textController: _nameController,
              colorBorder: AppColors.colorScheme.primary,
              textLength: 30,
              hintText: t.profile.enterTitleHint,
              hintStyle: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.colorScheme.primary.withOpacity(0.9),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildIconsGrid()),
            const SizedBox(height: 10),
            SizedBox(width: 200, child: _buildAddButton()),
          ],
        ),
      ),),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 30, height: 30),
        Text(t.profile.newCategory, style: theme.textTheme.displaySmall),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.divider,
            ),
            child: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }

  Widget _buildColorIconSelector() {
    return GestureDetector(
      onTap: _pickColor,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedColor,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            _selectedIcon,
            color: getIconColor(_selectedColor),
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildIconsGrid() {
    return GridView.builder(
      itemCount: _icons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, index) {
        final icon = _icons[index];
        final isSelected = _selectedIcon == icon;
        return GestureDetector(
          onTap: () => setState(() => _selectedIcon = icon),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.surface,
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(icon, color: AppColors.onSecondary),
                ),
                if (isSelected)
                  const Positioned(
                    top: 5,
                    right: 5,
                    child: Icon(Icons.check_circle, color: AppColors.primary, size: 20),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddButton() {
    return AppButton(
      title: t.profile.saveBtn,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 39,
      radius: 10,
      gradientColors: _gradientColors,
      onPressed: () {
        if (_validate()) {
          widget.onCategoryAdded(_nameController.text, colorToHex(_selectedColor), _selectedIcon);
          Navigator.pop(context);
        }
      },
    );
  }
}
