// class Validator {
//   static bool isVaildEmail({required String email}) {
//     var pattern =
//         r'(^[a-zA-Z\u0900-\u097F0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
//     var regExp = RegExp(pattern);
//     return regExp.hasMatch(email);
//   }

//   static bool isValidUsername({required String? username}) {
//     if (username == null || username.trim().isEmpty) {
//       return false;
//     }
//     final regex = RegExp(r'^[a-zA-Z0-9._]+$');
//     if (!regex.hasMatch(username)) {
//       return false;
//     }
//     return true;
//   }
// }

class Validator {
  
  static bool isValidId({
    required int? teamId}) {
    if (teamId == null || ){
      return false;
    }
    else{
      return true;
    }
  }
}