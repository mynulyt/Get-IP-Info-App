import 'dart:convert';
import 'package:http/http.dart' as http;

class IpData {
  static Future<String> getMyIpAddress() async {
    http.Response res =
        await http.get(Uri.parse("https://api.ipify.org/?format=json"));

    if (res.statusCode == 200) {
      print(jsonDecode(res.body)["ip"]);
      return jsonDecode(res.body)["ip"];
    }

    return "No IP Address Found";
  }

  static Future<Map> getIpInfo(String ipAddress) async {
    http.Response res =
        await http.get(Uri.parse("https://ipinfo.io/$ipAddress/geo"));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    return {
      "ip": "Failed to fetch ip",
      "city": "Failed",
      "region": "Failed",
      "country": "Failed",
      "org": "Faild",
      "loc": "Failed",
      "postal": "Failed",
      "timezone": "Failed",
    };
  }
}
