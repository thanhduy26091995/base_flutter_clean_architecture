import 'package:base_flutter_clean_architecture/data/network/response/album_response.dart';
import 'package:base_flutter_clean_architecture/network/api_client/json_transformer.dart';

class AlbumTransformer implements JsonTransformer<List<AlbumResponse>> {
  @override
  Future<List<AlbumResponse>> Function(dynamic json) get transform =>
      (json) async {
        if (json is List) {
          return json.map((item) => AlbumResponse.fromJson(item)).toList();
        }
        return List.empty();
      };
}
