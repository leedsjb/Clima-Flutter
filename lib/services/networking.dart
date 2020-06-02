import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String _url;

  /// Instantiate a new NetworkHelper
  /// @param url the url to which the Network Helper makes requests
  NetworkHelper(this._url); // dart syntax shortcut to set instance field
  // see https://dart.dev/guides/language/language-tour#constructors

  Future makeRequest() async {
    http.Response r = await http.get(this._url);

    if (r.statusCode == 200) {
      String data = r.body;
      // print(data);
      return jsonDecode(data);
    } else {
      print('Status code: ' + r.statusCode.toString());
    }
  }
}
