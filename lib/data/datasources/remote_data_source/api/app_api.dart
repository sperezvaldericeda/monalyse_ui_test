import 'package:dio/dio.dart';
import 'package:monalyse_ui_test/data/models/example_remote_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String? baseUrl}) = _AppApi;

  @GET('/api/example')
  Future<ExampleRemoteEntity> getMyExamples();
}
