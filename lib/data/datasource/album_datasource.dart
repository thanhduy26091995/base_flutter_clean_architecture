import 'package:base_flutter_clean_architecture/data/datasource/album_datasource_abstract.dart';
import 'package:base_flutter_clean_architecture/data/network/constants.dart';
import 'package:base_flutter_clean_architecture/data/network/response/album_response.dart';
import 'package:base_flutter_clean_architecture/data/network/transformer/album_detail_transformer.dart';
import 'package:base_flutter_clean_architecture/data/network/transformer/album_transformer.dart';
import 'package:base_flutter_clean_architecture/network/api_client/http_client.dart';

class AlbumDataSource implements IAlbumDataSource {
  final APIClient client;

  AlbumDataSource(this.client);

  @override
  Future<List<AlbumResponse>> getAlbumList() async {
    return await client.get<List<AlbumResponse>>(
      url: EndPoint.getAlbumList,
      parse: AlbumTransformer().transform,
      parseError: (error, code) {
        throw Exception("Failed to load albums");
      },
    );
  }

  @override
  Future<AlbumResponse> getAlbumDetail(int albumId) async {
    return await client.get(
        url: EndPoint.formattedUrl(EndPoint.getAlbumDetail,
            params: {"albumId": albumId.toString()}),
        parse: AlbumDetailTransformer().transform,
        parseError: (error, code) {
          throw Exception("Failed to load albums");
        });
  }
}
