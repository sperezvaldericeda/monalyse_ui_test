import 'package:monalyse_ui_test/data/models/example_remote_entity.dart';

abstract class AppRemoteDataSourceContract {
  Future<ExampleRemoteEntity> getExamples();
}
