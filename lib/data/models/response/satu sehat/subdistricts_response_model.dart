import 'dart:convert';

class SubDistrictsResponseModel {
  final int? status;
  final bool? error;
  final String? message;
  final List<SubDistricts>? data;

  SubDistrictsResponseModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory SubDistrictsResponseModel.fromJson(String str) =>
      SubDistrictsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubDistrictsResponseModel.fromMap(Map<String, dynamic> json) =>
      SubDistrictsResponseModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SubDistricts>.from(
                json["data"]!.map((x) => SubDistricts.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "error": error,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class SubDistricts {
  final String? code;
  final String? parentCode;
  final String? bpsCode;
  final String? name;

  SubDistricts({
    this.code,
    this.parentCode,
    this.bpsCode,
    this.name,
  });

  factory SubDistricts.fromJson(String str) =>
      SubDistricts.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubDistricts.fromMap(Map<String, dynamic> json) => SubDistricts(
        code: json["code"],
        parentCode: json["parent_code"],
        bpsCode: json["bps_code"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "parent_code": parentCode,
        "bps_code": bpsCode,
        "name": name,
      };

  @override
  String toString() {
    return '$name';
  }
}
