import 'dart:convert';

class PatientScheduleResponseModel {
    final List<PatientSchedule>? data;
    final String? message;
    final String? status;

    PatientScheduleResponseModel({
        this.data,
        this.message,
        this.status,
    });

    factory PatientScheduleResponseModel.fromJson(String str) => PatientScheduleResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PatientScheduleResponseModel.fromMap(Map<String, dynamic> json) => PatientScheduleResponseModel(
        data: json["data"] == null ? [] : List<PatientSchedule>.from(json["data"]!.map((x) => PatientSchedule.fromMap(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "status": status,
    };
}

class PatientSchedule {
    final int? id;
    final int? patientId;
    final int? doctorId;
    final DateTime? scheduleTime;
    final String? complaint;
    final String? status;
    final int? noAntrian;
    final String? paymentMethod;
    final int? totalPrice;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    PatientSchedule({
        this.id,
        this.patientId,
        this.doctorId,
        this.scheduleTime,
        this.complaint,
        this.status,
        this.noAntrian,
        this.paymentMethod,
        this.totalPrice,
        this.createdAt,
        this.updatedAt,
    });

    factory PatientSchedule.fromJson(String str) => PatientSchedule.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PatientSchedule.fromMap(Map<String, dynamic> json) => PatientSchedule(
        id: json["id"],
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        scheduleTime: json["schedule_time"] == null ? null : DateTime.parse(json["schedule_time"]),
        complaint: json["complaint"],
        status: json["status"],
        noAntrian: json["no_antrian"],
        paymentMethod: json["payment_method"],
        totalPrice: json["total_price"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "patient_id": patientId,
        "doctor_id": doctorId,
        "schedule_time": scheduleTime?.toIso8601String(),
        "complaint": complaint,
        "status": status,
        "no_antrian": noAntrian,
        "payment_method": paymentMethod,
        "total_price": totalPrice,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
