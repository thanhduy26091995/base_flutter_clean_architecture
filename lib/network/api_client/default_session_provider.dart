import 'package:base_flutter_clean_architecture/network/api_client/session_provider.dart';

class DefaultSessionProvider implements ISessionProvider {
  @override
  String getBaseUrl() {
    return "https://jsonplaceholder.typicode.com";
  }

  @override
  Map<String, String> getHeaders() {
    return {};
  }
}
