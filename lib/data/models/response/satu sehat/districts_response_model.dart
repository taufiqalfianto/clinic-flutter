import 'dart:convert';

class DistrictsResponseModel {
    final int? status;
    final bool? error;
    final String? message;
    final List<Districts>? data;

    DistrictsResponseModel({
        this.status,
        this.error,
        this.message,
        this.data,
    });

    factory DistrictsResponseModel.fromJson(String str) => DistrictsResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DistrictsResponseModel.fromMap(Map<String, dynamic> json) => DistrictsResponseModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Districts>.from(json["data"]!.map((x) => Districts.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "error": error,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Districts {
    final String? code;
    final String? parentCode;
    final String? bpsCode;
    final String? name;

    Districts({
        this.code,
        this.parentCode,
        this.bpsCode,
        this.name,
    });

    factory Districts.fromJson(String str) => Districts.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Districts.fromMap(Map<String, dynamic> json) => Districts(
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
