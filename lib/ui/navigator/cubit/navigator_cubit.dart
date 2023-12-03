import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void updateIndex(int index) => emit(index);

  void getDiagram() => emit(0);

  void getCalculator() => emit(1);

  void getProfile() => emit(2);
}