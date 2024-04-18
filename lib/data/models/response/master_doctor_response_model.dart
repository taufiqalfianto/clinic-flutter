import 'dart:convert';

class MasterDoctorResponseModel {
    final List<DoctorMaster>? data;
    final String? message;

    MasterDoctorResponseModel({
        this.data,
        this.message,
    });

    factory MasterDoctorResponseModel.fromJson(String str) => MasterDoctorResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MasterDoctorResponseModel.fromMap(Map<String, dynamic> json) => MasterDoctorResponseModel(
        data: json["data"] == null ? [] : List<DoctorMaster>.from(json["data"]!.map((x) => DoctorMaster.fromMap(x))),
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
    };
}

class DoctorMaster {
    final int? id;
    final String? doctorName;
    final String? doctorSpecialis;
    final String? doctorPhone;
    final String? doctorEmail;
    final String? doctorPhoto;
    final String? doctorAddress;
    final String? doctorSip;
    final dynamic idIhs;
    final dynamic nik;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    DoctorMaster({
        this.id,
        this.doctorName,
        this.doctorSpecialis,
        this.doctorPhone,
        this.doctorEmail,
        this.doctorPhoto,
        this.doctorAddress,
        this.doctorSip,
        this.idIhs,
        this.nik,
        this.createdAt,
        this.updatedAt,
    });

    factory DoctorMaster.fromJson(String str) => DoctorMaster.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DoctorMaster.fromMap(Map<String, dynamic> json) => DoctorMaster(
        id: json["id"],
        doctorName: json["doctor_name"],
        doctorSpecialis: json["doctor_specialis"],
        doctorPhone: json["doctor_phone"],
        doctorEmail: json["doctor_email"],
        doctorPhoto: json["doctor_photo"],
        doctorAddress: json["doctor_address"],
        doctorSip: json["doctor_sip"],
        idIhs: json["id_ihs"],
        nik: json["nik"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "doctor_name": doctorName,
        "doctor_specialis": doctorSpecialis,
        "doctor_phone": doctorPhone,
        "doctor_email": doctorEmail,
        "doctor_photo": doctorPhoto,
        "doctor_address": doctorAddress,
        "doctor_sip": doctorSip,
        "id_ihs": idIhs,
        "nik": nik,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
