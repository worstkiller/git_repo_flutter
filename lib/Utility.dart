/// get url encoded string
/// @param baseUrl
/// @param keyValue
class Utility {
  static String getUrlEncoded(String baseUrl, Map<String, String> keyValue) {
    var result = "";
    keyValue.forEach((k, v) => result = result + "$k=$v&");
    return baseUrl + "?" + "$result";
  }
}
