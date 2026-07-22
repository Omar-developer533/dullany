import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dullany/features/control/data/repo/control_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.controlRepo) : super(CategoryInitial());
  final ControlRepo controlRepo;
  final String collectionName = 'Category';
  Future<void> addCategory(Map<String, dynamic> categoryValue) async {
    emit(AddCategoryLoaading());
    final result = await controlRepo.addDoc(collectionName, categoryValue);
    result.fold(
      (error) {
        emit(AddCategoryFailer(errorMessage: error.errorMessage));
      },
      (succes) {
        emit(AddCategorySucces());
      },
    );
  }
}
