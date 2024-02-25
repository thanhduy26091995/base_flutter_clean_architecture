import 'package:base_flutter_clean_architecture/data/datasource/album_datasource_abstract.dart';
import 'package:base_flutter_clean_architecture/data/network/constants.dart';
import 'package:base_flutter_clean_architecture/data/network/response/album_response.dart';
import 'package:base_flutter_clean_architecture/network/api_client/default_remote_datasource.dart';

class AlbumDataSource extends DefaultRemoteDataSource<List<AlbumResponse>>
    implements IAlbumDataSource {
  AlbumDataSource(super.client, super.jsonTransformer);


  @override
  Future<List<AlbumResponse>> getAlbumList() async {
    final response = await get(url: EndPoint.getAlbumList, parameters: {});
    return response;
  }
}
