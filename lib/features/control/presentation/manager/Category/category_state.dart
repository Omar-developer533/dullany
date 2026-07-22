part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class AddCategoryLoaading extends CategoryState {}

final class AddCategorySucces extends CategoryState {}

final class AddCategoryFailer extends CategoryState {
  final String errorMessage;

  AddCategoryFailer({required this.errorMessage});
}
