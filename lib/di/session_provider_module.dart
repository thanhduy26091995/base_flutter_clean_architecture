import 'package:base_flutter_clean_architecture/network/api_client/default_session_provider.dart';

mixin DefaultSessionProviderModule {
  DefaultSessionProvider get defaultSessionProvider {
    return DefaultSessionProvider();
  }
}
