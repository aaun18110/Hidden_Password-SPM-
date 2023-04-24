// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class LoginProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _isHidden = true;
  bool get isHidden => _isHidden;

  void isVeiwPassword() {
    _isHidden = !_isHidden;
    notifyListeners();
  }

  void getdata(String email, String password) async {
    setLoading(true);
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        print("Sucessfully");
        setLoading(false);
      } else {
        print("Failed");
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
