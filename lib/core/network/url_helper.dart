class URL {
  static const _baseUrl = "https://api.escuelajs.co/api/v1";
  static String products([int offset = 0, int limit = 10]) {
    return "$_baseUrl/products?offset=$offset&limit=$limit";
  }
}