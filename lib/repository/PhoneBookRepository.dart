import 'dart:convert';
import 'package:appinion_hrm/repository/NetoworkConstant.dart';
import 'package:appinion_hrm/model/phone_book.dart';
import 'package:http/http.dart' as http;

class PhoneBookRepository {
  static var client = http.Client();

  static Future<List<PhoneBook>?> phoneBookData() async {
    var url = BASE_URL + PHONEBOOK;


    var response =
    await client.get(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      List<dynamic> jsonList=jsonDecode(response.body);
      List<PhoneBook>  phoneBookList=phoneBookJsonList(jsonList);

 /*     var json =jsonDecode(response.body);
      var loginResponse = PhoneBook.fromJson(json);

      return loginResponse;*/
      return phoneBookList;
    } else {
      return null;
    }
  }
}
