import 'package:base_flutter_clean_architecture/di/session_provider_module.dart';
import 'package:base_flutter_clean_architecture/network/api_client/http_client.dart';

mixin ClientModule on DefaultSessionProviderModule {
  APIClient get apiClient {
    return APIClient(defaultSessionProvider);
  }
}
