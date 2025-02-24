import 'package:ctfinfo/api/end_points.dart';
import 'package:http/http.dart' as http;

class Validator {
  Future isValidId({required String? teamId}) async {
    final response =
        await http.get(Uri.parse("${EndPoints.baseUrl}/teams/$teamId"));
    if (teamId == null || response.statusCode == 404) {
      return false;
    } else {
      return true;
    }
  }

  static bool isDigit({required String? teamId}) {
    RegExp regExp = RegExp(r'^\d{0,10}$');
    return regExp.hasMatch(teamId!);
  }
}
