import 'dart:convert';

class ServiceMedicineResponseModel {
    final List<ServiceMedicine>? data;
    final String? message;
    final String? status;

    ServiceMedicineResponseModel({
        this.data,
        this.message,
        this.status,
    });

    factory ServiceMedicineResponseModel.fromJson(String str) => ServiceMedicineResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ServiceMedicineResponseModel.fromMap(Map<String, dynamic> json) => ServiceMedicineResponseModel(
        data: json["data"] == null ? [] : List<ServiceMedicine>.from(json["data"]!.map((x) => ServiceMedicine.fromMap(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "status": status,
    };
}

class ServiceMedicine {
    final int? id;
    final String? name;
    final String? category;
    final String? price;
    final int? quantity;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    ServiceMedicine({
        this.id,
        this.name,
        this.category,
        this.price,
        this.quantity,
        this.createdAt,
        this.updatedAt,
    });

    factory ServiceMedicine.fromJson(String str) => ServiceMedicine.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ServiceMedicine.fromMap(Map<String, dynamic> json) => ServiceMedicine(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
