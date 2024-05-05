import 'dart:convert';

class AddReservationResponseModel {
    final Data? data;
    final String? message;
    final String? status;

    AddReservationResponseModel({
        this.data,
        this.message,
        this.status,
    });

    factory AddReservationResponseModel.fromJson(String str) => AddReservationResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddReservationResponseModel.fromMap(Map<String, dynamic> json) => AddReservationResponseModel(
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
    final int? patientId;
    final int? doctorId;
    final DateTime? scheduleTime;
    final String? complaint;
    final String? status;
    final int? noAntrian;
    final DateTime? updatedAt;
    final DateTime? createdAt;
    final int? id;

    Data({
        this.patientId,
        this.doctorId,
        this.scheduleTime,
        this.complaint,
        this.status,
        this.noAntrian,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        scheduleTime: json["schedule_time"] == null ? null : DateTime.parse(json["schedule_time"]),
        complaint: json["complaint"],
        status: json["status"],
        noAntrian: json["no_antrian"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "schedule_time": scheduleTime?.toIso8601String(),
        "complaint": complaint,
        "status": status,
        "no_antrian": noAntrian,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
