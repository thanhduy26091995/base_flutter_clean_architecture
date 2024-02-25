import 'package:base_flutter_clean_architecture/data/network/transformer/album_transformer.dart';

mixin TransformerModule {
  AlbumTransformer get albumTransformer {
    return AlbumTransformer();
  }
}
