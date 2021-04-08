import 'package:http/http.dart' as Http;
import 'package:listing_app/data_model.dart';

class Services {
  static Uri url = Uri.parse('https://api.ona.io/api/v1/data/458237');

  static Future<List<MemberModel>> getMembers() async {
    try {
      final response = await Http.get(url);
      if (response.statusCode == 200) {
        final List<MemberModel> members = memberModelFromJson(response.body);
        return members;
      }
    } catch (e) {
      print(e);
    }
    return List<MemberModel>.empty();
  }
}
