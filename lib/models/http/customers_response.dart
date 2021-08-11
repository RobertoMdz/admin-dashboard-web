import 'dart:convert';

import '../usuario.dart';

class CustomersResponse {
  CustomersResponse({
    required this.total,
    required this.usuarios,
  });

  int total;
  List<Usuario> usuarios;

  factory CustomersResponse.fromJson(String str) =>
      CustomersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomersResponse.fromMap(Map<String, dynamic> json) =>
      CustomersResponse(
        total: json["total"],
        usuarios:
            List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
      };
}
