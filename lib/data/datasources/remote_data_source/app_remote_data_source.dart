import 'package:monalyse_ui_test/data/datasources/remote_data_source/api/app_api.dart';
import 'package:monalyse_ui_test/data/models/example_remote_entity.dart';
import 'package:monalyse_ui_test/data/repositories/data_source_contracts/remote/app_remote_data_source_contract.dart';

class AppRemoteDataSource implements AppRemoteDataSourceContract {
  final AppApi _api;

  AppRemoteDataSource(this._api);
  @override
  Future<ExampleRemoteEntity> getExamples() async {
    final response = await _api.getMyExamples();

    return response;
  }
}
