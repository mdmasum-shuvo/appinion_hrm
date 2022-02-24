import 'dart:convert';

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      this.currentPage, 
      this.from, 
      this.path, 
      this.perPage, 
      this.to,});

  Meta.fromJson(dynamic json) {
    currentPage = json['current_page'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
  }
  int? currentPage;
  int? from;
  String? path;
  int? perPage;
  int? to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['path'] = path;
    map['per_page'] = perPage;
    map['to'] = to;
    return map;
  }

}