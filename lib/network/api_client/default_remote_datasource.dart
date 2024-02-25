import 'package:base_flutter_clean_architecture/network/api_client/http_client.dart';
import 'package:base_flutter_clean_architecture/network/api_client/json_transformer.dart';

class DefaultRemoteDataSource<T> {
  final APIClient _client;
  final JsonTransformer<T> _jsonTransformer;

  DefaultRemoteDataSource(this._client, this._jsonTransformer);

  Future<T> get(
      {required String url, required Map<String, dynamic> parameters}) async {
    return _client.get(
        url: url,
        parameters: parameters,
        parse: (json) {
          return _jsonTransformer.transform(json);
        },
        parseError: (error, statusCode) {
          return Future(() => error);
        });
  }
}
