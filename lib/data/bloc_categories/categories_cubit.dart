import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:family_budget/data/models/category_model.dart';
import 'package:family_budget/data/repositories/category_repository.dart';
import 'package:family_budget/helpers/enums.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:injectable/injectable.dart';

part 'categories_state.dart';

@singleton
class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository _categoryRepository;

  CategoriesCubit(this._categoryRepository) : super(CategoriesInitial()) {
   loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      emit(CategoriesLoading());
      final categories = await _categoryRepository.getAll();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError("Ошибка загрузки категорий: $e"));
    }
  }

  Future<void> addCategory(String name, String color, String icon) async {
    try {
      final newCategory = await _categoryRepository.createCategory(name, color, icon);
      final currentState = state;
      if (currentState is CategoriesLoaded) {
        emit(CategoriesLoaded(List.from(currentState.categories)..add(newCategory)));
      }
    } catch (e) {
      showMessage(message: "Ошибка добавления категории: $e", type: PageState.error);
    }
  }

  Future<void> deleteCategory(int categoryId) async {
    try {
      await _categoryRepository.delete(categoryId);
      final currentState = state;
      if (currentState is CategoriesLoaded) {
        emit(CategoriesLoaded(
          currentState.categories.where((c) => c.id != categoryId).toList(),
        ));
      }
    } catch (e) {
      showMessage(message: "Ошибка удаления категории: $e", type: PageState.error);
    }
  }
}
