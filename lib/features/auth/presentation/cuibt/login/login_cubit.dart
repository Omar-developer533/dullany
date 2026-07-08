import 'package:bloc/bloc.dart';
import 'package:dullany/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());
  final AuthRepo _authRepo;
  Future<void> login(String phonNum, String password) async {
    emit(LoginLoading());
    final result = await _authRepo.login(phonNum, password);
    result.fold(
      (failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      },
      (succes) {
        emit(LoginSuccess());
      },
    );
  }
}
