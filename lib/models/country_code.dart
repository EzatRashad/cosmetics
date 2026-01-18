class CountryCode {
  int? id;
  String? code;
  String? name;

  CountryCode({this.id, this.code, this.name});

  CountryCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
  }

  
}