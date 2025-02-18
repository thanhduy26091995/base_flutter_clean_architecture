import 'package:base_flutter_clean_architecture/data/network/response/album_response.dart';
import 'package:base_flutter_clean_architecture/network/api_client/json_transformer.dart';

class AlbumDetailTransformer implements JsonTransformer<AlbumResponse> {
  @override
  Future<AlbumResponse> Function(dynamic json) get transform => (json) async {
        return AlbumResponse.fromJson(json);
      };
}
