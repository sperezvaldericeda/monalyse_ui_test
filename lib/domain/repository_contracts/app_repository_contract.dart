import 'package:monalyse_ui_test/app/types/result.dart';

abstract class AppRepositoryContract {
  Future<Result<bool>> getValidToken();

  Future<Result<void>> setValidToken(bool value);

  Future<Result<bool>> logIn();

  Future<Result<void>> logOut();
}
