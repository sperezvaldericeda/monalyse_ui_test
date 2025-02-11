import 'package:get_it/get_it.dart';
import 'package:monalyse_ui_test/app/config/environment_config.dart';
import 'package:monalyse_ui_test/app/constants/app_urls.dart';
import 'package:monalyse_ui_test/data/datasources/local_data_source/app_local_datasource.dart';
import 'package:monalyse_ui_test/data/datasources/remote_data_source/api/app_api.dart';
import 'package:monalyse_ui_test/data/datasources/remote_data_source/api/network/dio_http_client.dart';
import 'package:monalyse_ui_test/data/datasources/remote_data_source/api/network/interceptors/curl_dio_interceptor.dart';
import 'package:monalyse_ui_test/data/datasources/remote_data_source/api/network/interceptors/mock_interceptor.dart';
import 'package:monalyse_ui_test/data/datasources/remote_data_source/app_remote_data_source.dart';
import 'package:monalyse_ui_test/data/repositories/app_repository.dart';
import 'package:monalyse_ui_test/data/repositories/data_source_contracts/local/app_local_datasource_contract.dart';
import 'package:monalyse_ui_test/data/repositories/data_source_contracts/remote/app_remote_data_source_contract.dart';
import 'package:monalyse_ui_test/domain/repository_contracts/app_repository_contract.dart';
import 'package:monalyse_ui_test/presentation/features/authentication/auth_bloc/auth_bloc.dart';
import 'package:monalyse_ui_test/presentation/features/splash/splash_bloc/splash_bloc.dart';
import 'package:monalyse_ui_test/presentation/top_blocs/language_bloc/language_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'modules/api_modules.dart';

part 'modules/local_modules.dart';

part 'modules/remote_modules.dart';

part 'modules/repository_modules.dart';

part 'modules/ui_modules.dart';

Future<void> initDi() async {
  _apiModulesInit();
  _remoteModulesInit();
  _localModulesInit(instance: await SharedPreferences.getInstance());
  _repositoryModulesInit();
  _uiModulesInit();
}
