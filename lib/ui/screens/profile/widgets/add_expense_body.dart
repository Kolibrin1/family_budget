import 'package:family_budget/data/bloc_categories/categories_cubit.dart';
import 'package:family_budget/data/models/category_model.dart';
import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/helpers/enums.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/ui/screens/diagram/bloc/diagram_bloc.dart';
import 'package:family_budget/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:family_budget/widgets/confirm_dialog.dart';
import 'package:family_budget/widgets/gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_category_bottom_sheet.dart';

class AddExpenseBody extends StatefulWidget {
  const AddExpenseBody({super.key, this.expense});

  final ExpenseModel? expense;

  @override
  State<AddExpenseBody> createState() => _AddExpenseBodyState();
}

class _AddExpenseBodyState extends State<AddExpenseBody> {
  final _totalCountController = TextEditingController();
  DateTime? _selectedDate;
  CategoryModel? _selectedCategory;

  @override
  void initState() {
    super.initState();
    if (widget.expense != null) {
      _totalCountController.text = widget.expense!.totalCount.toString();
      _selectedDate = widget.expense!.date;
      _selectedCategory = widget.expense!.category;
    }
  }

  bool _validate() {
    if (_totalCountController.text.isNotEmpty && _selectedDate != null && _selectedCategory != null) {
      return true;
    }
    showMessage(message: 'Выберите категорию, укажите сумму и дату!', type: PageState.info);
    return false;
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    return pickedDate ?? DateTime.now();
  }

  void _onNewCategory(BuildContext context) {
    showAddCategoryBottomSheet(
      context: context,
      onCategoryAdded: (name, color, icon) => context.read<CategoriesCubit>().addCategory(name, color, icon),
    );
  }

  void _onDeleteCategory(BuildContext context, CategoryModel category) {
    showConfirmDialog(
      context: context,
      title: 'Удаление категории',
      message: 'Вы точно хотите удалить категорию "${category.name}"?',
      item: category,
      onConfirm: () => context.read<CategoriesCubit>().deleteCategory(category.id!),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.expense != null ? 'Изменить расход' : 'Добавить расход',
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => widget.expense != null
              ? context.read<DiagramBloc>().add(DiagramSelectTypeViewEvent(
                    type: context.read<DiagramBloc>().type,
                  ))
              : context.read<ProfileBloc>().add(const ProfileInitialEvent()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(
              textController: _totalCountController,
              colorBorder: AppColors.colorScheme.primary,
              hintText: 'Укажите сумму',
              hintStyle: theme.textTheme.titleSmall?.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 20),
            _buildDateSelector(theme),
            const SizedBox(height: 20),
            Text(
              'Выберите категорию',
              style: theme.textTheme.displaySmall,
            ),
            const SizedBox(height: 10),
            Expanded(child: _buildCategoriesGrid(context)),
            const SizedBox(height: 10),
            _buildActionButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector(ThemeData theme) {
    return InkWell(
      onTap: () async {
        _selectedDate = await _selectDate(context);
        setState(() {});
      },
      child: Text(
        _selectedDate?.formatNumberDate ?? 'Выбрать дату',
        style: theme.textTheme.displaySmall?.copyWith(color: AppColors.colorScheme.primary),
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) return LoadingGif();
        if (state is CategoriesLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 8,
              mainAxisExtent: 100,
            ),
            itemCount: state.categories.length + 1,
            itemBuilder: (_, index) => index == 0
                ? _buildNewCategoryButton(context)
                : _buildCategoryItem(context, state.categories[index - 1]),
          );
        }
        context.read<CategoriesCubit>().loadCategories();
        return LoadingGif();
      },
    );
  }

  Widget _buildNewCategoryButton(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => _onNewCategory(context),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: const Icon(Icons.add, color: AppColors.primary, size: 32),
          ),
          const SizedBox(height: 5),
          Text(
            'Новый',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, CategoryModel category) {
    final theme = Theme.of(context);
    final isSelected = _selectedCategory?.id == category.id;
    final color = hexToColor(category.color ?? '');
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = category),
      onLongPress: () => _onDeleteCategory(context, category),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color, border: Border.all(color: isSelected ? AppColors.primary : Colors.transparent, width: 2)),
            child: Center(
              child: SvgPicture.asset(
                category.icon ?? '',
                width: 32,
                height: 32,
                color: getIconColor(color),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            category.name ?? '',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isSelected ? AppColors.primary : AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return AppButton(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      radius: 10,
      title: widget.expense != null ? 'Изменить' : 'Добавить',
      textColor: AppColors.white,
      onPressed: () {
        if (_validate()) {
          final totalCount = double.tryParse(_totalCountController.text) ?? 0;
          if (widget.expense != null) {
            context.read<DiagramBloc>().add(
                  DiagramEditExpenseEvent(
                    expenseId: widget.expense!.id!,
                    totalCount: totalCount,
                    categoryId: _selectedCategory!.id!,
                    date: _selectedDate!,
                  ),
                );
          } else {
            context.read<ProfileBloc>().add(
                  ProfileAddExpenseEvent(
                    totalCount: totalCount,
                    categoryId: _selectedCategory!.id!,
                    date: _selectedDate!,
                  ),
                );
          }
        }
      },
      gradientColors: const [
        AppColors.complementaryBlue,
        AppColors.primary,
        AppColors.primary,
        AppColors.complementaryBlue,
      ],
    );
  }
}
