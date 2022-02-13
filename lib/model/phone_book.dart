import 'dart:convert';

PhoneBook phoneBookFromJson(String str) => PhoneBook.fromJson(json.decode(str));

List<PhoneBook> phoneBookJsonList(List<dynamic> parsedListJson )  =>
    List<PhoneBook>.from(parsedListJson.map((i) => PhoneBook.fromJson(i)));

String phoneBookToJson(PhoneBook data) => json.encode(data.toJson());
class PhoneBook {
  PhoneBook({
      this.name, 
      this.email, 
      this.phone, 
      this.photo, 
      this.designations, 
      this.bloodGroup,});

  PhoneBook.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    designations = json['designations'];
    bloodGroup = json['blood_group'];
  }
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? designations;
  String? bloodGroup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['photo'] = photo;
    map['designations'] = designations;
    map['blood_group'] = bloodGroup;
    return map;
  }

}