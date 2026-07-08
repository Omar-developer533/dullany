import 'package:dullany/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit(this._authRepo) : super(RegisterInitial());
  final AuthRepo _authRepo;
  Future<void> registerUser(String phonNum, String passwored) async {
    emit(RegisterLoading());
    final result = await _authRepo.registerUser(phonNum, passwored);
    result.fold(
      (failure) {
        emit(RegisterFailure(errorMessage: failure.errorMessage));
      },
      (succes) {
        emit(RegisterSucces());
      },
    );
  }
}
