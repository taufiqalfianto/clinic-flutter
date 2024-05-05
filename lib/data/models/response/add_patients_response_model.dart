import 'dart:convert';

class AddPatientsResponseModel {
    final Data? data;
    final String? message;
    final String? status;

    AddPatientsResponseModel({
        this.data,
        this.message,
        this.status,
    });

    factory AddPatientsResponseModel.fromJson(String str) => AddPatientsResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddPatientsResponseModel.fromMap(Map<String, dynamic> json) => AddPatientsResponseModel(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "message": message,
        "status": status,
    };
}

class Data {
    final String? nik;
    final String? kk;
    final String? name;
    final String? phone;
    final String? email;
    final String? gender;
    final String? birthPlace;
    final DateTime? birthDate;
    final String? addressLine;
    final String? isDeceased;
    final String? city;
    final String? cityCode;
    final String? province;
    final String? provinceCode;
    final String? district;
    final String? districtCode;
    final String? village;
    final String? villageCode;
    final String? rt;
    final String? rw;
    final String? postalCode;
    final String? maritalStatus;
    final DateTime? updatedAt;
    final DateTime? createdAt;
    final int? id;

    Data({
        this.nik,
        this.kk,
        this.name,
        this.phone,
        this.email,
        this.gender,
        this.birthPlace,
        this.birthDate,
        this.addressLine,
        this.isDeceased,
        this.city,
        this.cityCode,
        this.province,
        this.provinceCode,
        this.district,
        this.districtCode,
        this.village,
        this.villageCode,
        this.rt,
        this.rw,
        this.postalCode,
        this.maritalStatus,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        nik: json["nik"],
        kk: json["kk"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        gender: json["gender"],
        birthPlace: json["birth_place"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        addressLine: json["address_line"],
        isDeceased: json["is_deceased"],
        city: json["city"],
        cityCode: json["city_code"],
        province: json["province"],
        provinceCode: json["province_code"],
        district: json["district"],
        districtCode: json["district_code"],
        village: json["village"],
        villageCode: json["village_code"],
        rt: json["rt"],
        rw: json["rw"],
        postalCode: json["postal_code"],
        maritalStatus: json["marital_status"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "nik": nik,
        "kk": kk,
        "name": name,
        "phone": phone,
        "email": email,
        "gender": gender,
        "birth_place": birthPlace,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "address_line": addressLine,
        "is_deceased": isDeceased,
        "city": city,
        "city_code": cityCode,
        "province": province,
        "province_code": provinceCode,
        "district": district,
        "district_code": districtCode,
        "village": village,
        "village_code": villageCode,
        "rt": rt,
        "rw": rw,
        "postal_code": postalCode,
        "marital_status": maritalStatus,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
