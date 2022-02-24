import 'data.dart';
import 'links.dart';
import 'meta.dart';
import 'dart:convert';

AllLeaveResponse allLeaveResponseFromJson(String str) => AllLeaveResponse.fromJson(json.decode(str));
String allLeaveResponseToJson(AllLeaveResponse data) => json.encode(data.toJson());
class AllLeaveResponse {
  AllLeaveResponse({
      this.data, 
      this.links, 
      this.meta,});

  AllLeaveResponse.fromJson(dynamic json) {
    final jsonData = jsonDecode(json);
    if (jsonData['data']!= null) {
      data = [];
      jsonData['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    links = jsonData['links'] != null ? Links.fromJson(jsonData['links']) : null;
    meta = jsonData['meta'] != null ? Meta.fromJson(jsonData['meta']) : null;
  }
  List<Data>? data;
  Links? links;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

}