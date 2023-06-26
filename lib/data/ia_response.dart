// To parse this JSON data, do
//
//  final welcome = welcomeFromJson(jsonString); // Ejemplo de cómo se podría usar una de las funciones

import 'dart:convert';


// Funciones del archivo //
IaResponse iaResponseFromJson(String str) => IaResponse.fromJson(json.decode(str));

String iaResponseToJson(IaResponse data) => json.encode(data.toJson());
// end //


class IaResponse{
    String mensaje;
    bool error;

    IaResponse({
        required this.mensaje,
        required this.error,
    });

    factory IaResponse.fromJson(Map<String, dynamic> json) => IaResponse(
        mensaje: json["mensaje"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "mensaje": mensaje,
        "error": error,
    };
}
