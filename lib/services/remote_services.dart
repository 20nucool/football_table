import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteServices {
  Future<Map<String, dynamic>?> getTable() async {
    var client = http.Client();
    var header = {"X-Auth-Token": "804f49c4b90b4fe7adca20ca139e0989"};
    var uri = Uri.parse(
        'https://api.football-data.org/v2/competitions/PD/standings?standingType=TOTAL');
    
    var response = await client.get(uri, headers: header);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }
}
