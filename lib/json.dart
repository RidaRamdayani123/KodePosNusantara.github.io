class Postal {
  int? code;
  bool? status;
  String? messages;
  List<Data>? data;

  Postal({this.code, this.status, this.messages, this.data});

  Postal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    messages = json['messages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['messages'] = this.messages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? province;
  String? city;
  String? subdistrict;
  String? urban;
  String? postalcode;

  Data(
      {this.province,
      this.city,
      this.subdistrict,
      this.urban,
      this.postalcode});

  Data.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    city = json['city'];
    subdistrict = json['subdistrict'];
    urban = json['urban'];
    postalcode = json['postalcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province'] = this.province;
    data['city'] = this.city;
    data['subdistrict'] = this.subdistrict;
    data['urban'] = this.urban;
    data['postalcode'] = this.postalcode;
    return data;
  }
}
