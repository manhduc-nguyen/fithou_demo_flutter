import 'package:bloc/bloc.dart';
import 'package:fithou_demo/network/repository/account_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AccountRepository _accountRepository = AccountRepository();

  LoginCubit() : super(LoginInitial());

  void login(String userName, String password) {
    emit(LoginLoadingState());

    _accountRepository
        .login(userName, password)
        .then(_handleLoginSuccess)
        .catchError(_handleLoginFailure);
  }

  void _handleLoginSuccess(bool result) {
    if (result) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailureState());
    }
  }

  void _handleLoginFailure(error) {
    emit(LoginFailureState());
  }
}
