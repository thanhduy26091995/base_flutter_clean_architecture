abstract interface class JsonTransformer<T> {
  Future<T> Function(dynamic json) get transform;
}