import 'dart:convert';

class DoctorScheduleResponseModel {
    final String? status;
    final List<DoctorSchedules>? data;
    final String? message;

    DoctorScheduleResponseModel({
        this.status,
        this.data,
        this.message,
    });

    factory DoctorScheduleResponseModel.fromJson(String str) => DoctorScheduleResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DoctorScheduleResponseModel.fromMap(Map<String, dynamic> json) => DoctorScheduleResponseModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<DoctorSchedules>.from(json["data"]!.map((x) => DoctorSchedules.fromMap(x))),
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
    };
}

class DoctorSchedules {
    final int? id;
    final int? doctorId;
    final String? day;
    final String? time;
    final String? status;
    final String? note;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Doctor? doctor;

    DoctorSchedules({
        this.id,
        this.doctorId,
        this.day,
        this.time,
        this.status,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.doctor,
    });

    factory DoctorSchedules.fromJson(String str) => DoctorSchedules.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DoctorSchedules.fromMap(Map<String, dynamic> json) => DoctorSchedules(
        id: json["id"],
        doctorId: json["doctor_id"],
        day: json["day"],
        time: json["time"],
        status: json["status"],
        note: json["note"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        doctor: json["doctor"] == null ? null : Doctor.fromMap(json["doctor"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "doctor_id": doctorId,
        "day": day,
        "time": time,
        "status": status,
        "note": note,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor": doctor?.toMap(),
    };
}

class Doctor {
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

    Doctor({
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

    factory Doctor.fromJson(String str) => Doctor.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Doctor.fromMap(Map<String, dynamic> json) => Doctor(
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
