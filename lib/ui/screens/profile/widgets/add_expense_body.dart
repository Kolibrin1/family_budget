import 'package:family_budget/data/bloc_categories/categories_cubit.dart';
import 'package:family_budget/data/models/category_model.dart';
import 'package:family_budget/data/models/expense_model.dart';
import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/extensions.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/styles/app_colors.dart';
import 'package:family_budget/styles/app_text_styles.dart';
import 'package:family_budget/ui/screens/diagram/bloc/diagram_bloc.dart';
import 'package:family_budget/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:family_budget/ui/screens/profile/widgets/add_category_bottom_sheet.dart';
import 'package:family_budget/widgets/app_button.dart';
import 'package:family_budget/widgets/app_text_field.dart';
import 'package:family_budget/widgets/confirm_dialog.dart';
import 'package:family_budget/widgets/gif_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpenseBody extends StatefulWidget {
  const AddExpenseBody({super.key, this.expense});

  final ExpenseModel? expense;

  @override
  State<AddExpenseBody> createState() => _AddExpenseBodyState();
}

class _AddExpenseBodyState extends State<AddExpenseBody> {
  final _totalCountController = TextEditingController();
  DateTime? curDate;

  CategoryModel? selectedCategory;
  List<CategoryModel> categories = [];

  @override
  void initState() {
    if (widget.expense != null) {
      _totalCountController.text = widget.expense!.totalCount.toString();
      curDate = widget.expense!.date;
      selectedCategory = widget.expense!.category;
    }
    super.initState();
  }

  bool validate() {
    if (_totalCountController.text.isNotEmpty &&
        curDate != null &&
        selectedCategory != null) {
      return true;
    } else {
      showMessage(
          message: 'Выберите категорию, укажите сумму и дату!',
          type: PageState.info);
      return false;
    }
  }

  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    return pickedDate ?? DateTime.now();
  }

  Color getIconColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }

  void onNewCategoryPressed(BuildContext ctx) {
    showAddCategoryBottomSheet(
        context: context,
        onCategoryAdded: (name, color, icon) {
          ctx.read<CategoriesCubit>().addCategory(name, color, icon);
        });
  }

  void onDeleteCategoryPressed(BuildContext ctx, CategoryModel category) {
    showConfirmDialog(
      context: ctx,
      title: "Удаление категории",
      message: "Вы точно хотите удалить категорию \"${category.name}\"?",
      onConfirm: () {
        ctx.read<CategoriesCubit>().deleteCategory(category.id!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.expense != null ? 'Изменить расход' : 'Добавить расход',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => widget.expense != null
              ? context.read<DiagramBloc>().add(DiagramEvent.selectTypeView(
                  type: context.read<DiagramBloc>().type))
              : context.read<ProfileBloc>().add(ProfileEvent.initial()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Поле ввода суммы
            AppTextField(
              textController: _totalCountController,
              colorBorder: AppColors.colorScheme.primary,
              hintText: 'Укажите сумму',
              hintStyle: AppTextStyles.textStyle16w400.copyWith(
                color: AppColors.colorScheme.primary.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 20),

            // Выбор даты
            InkWell(
              onTap: () async {
                curDate = await selectDate(context);
                setState(() {});
              },
              child: curDate == null
                  ? Text(
                      'Выбрать дату',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorScheme.primary,
                      ),
                    )
                  : Text(
                      curDate!.formatNumberDate,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorScheme.primary,
                      ),
                    ),
            ),

            const SizedBox(height: 20),
            Text(
              'Выберите категорию',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return LoadingGif();
                } else if (state is CategoriesLoaded) {
                  categories = state.categories;
                  return Flexible(
                    child: GridView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // 4 элемента в ряд
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 100,
                      ),
                      itemCount: categories.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // Первый элемент - кнопка "Новый"
                          return GestureDetector(
                            onTap: () => onNewCategoryPressed(context),
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: AppColors.primary, width: 2),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.add,
                                        color: AppColors.primary, size: 32),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Новый",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }
                        final category = categories[index - 1];
                        final isSelected = selectedCategory?.id == category.id;
                        return GestureDetector(
                          onTap: () {
                            setState(() => selectedCategory = category);
                          },
                          onLongPress: () =>
                              onDeleteCategoryPressed(context, category),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: hexToColor(category.color ?? ''),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    category.icon ?? '',
                                    width: 32,
                                    height: 32,
                                    color: getIconColor(
                                        hexToColor(category.color ?? '')),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                category.name ?? '',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  context.read<CategoriesCubit>().loadCategories();
                  return LoadingGif();
                }
              },
            ),
            const SizedBox(height: 10),
            AppButton(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              radius: 10,
              title: widget.expense != null ? 'Изменить' : 'Добавить',
              textColor: AppColors.white,
              onPressed: () {
                if (validate()) {
                  if (widget.expense != null) {
                    context.read<DiagramBloc>().add(
                          DiagramEvent.editExpense(
                            expenseId: widget.expense!.id!,
                            totalCount:
                                double.tryParse(_totalCountController.text) ??
                                    0,
                            categoryId: selectedCategory!.id!,
                            date: curDate!,
                          ),
                        );
                  } else {
                    context.read<ProfileBloc>().add(
                          ProfileEvent.addExpense(
                            totalCount:
                                double.tryParse(_totalCountController.text) ??
                                    0,
                            categoryId: selectedCategory!.id!,
                            date: curDate!,
                          ),
                        );
                  }
                }
              },
              gradientColors: const [
                AppColors.complementaryBlue,
                AppColors.primary,
                AppColors.primary,
                AppColors.complementaryBlue
              ],
            ),
          ],
        ),
      ),
    );
  }
}
