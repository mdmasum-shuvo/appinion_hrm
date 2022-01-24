/// status : "success"
/// token : "3|pVKxxwOs8N1HgBYFBOaIlAROKt7R9WNnlkx4pmLC"

class LoginResponse {
  LoginResponse({
    String? status,
    String? token,
  }) {
    _status = status;
    _token = token;
  }

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _token = json['token'];
  }

  String? _status;
  String? _token;

  String? get status => _status;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['token'] = _token;
    return map;
  }
}
