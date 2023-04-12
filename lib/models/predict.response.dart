// To parse this JSON data, do
//
//     final predictResponse = predictResponseFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

PredictResponse predictResponseFromJson(String str) => PredictResponse.fromJson(json.decode(str));

String predictResponseToJson(PredictResponse data) => json.encode(data.toJson());

class PredictResponse {
    PredictResponse({
        required this.type,
        required this.accuracy,
    });

    String type;
    String accuracy;

    factory PredictResponse.fromJson(Map<String, dynamic> json) => PredictResponse(
        type: json["type"],
        accuracy: (json["accuracy"]*100).toStringAsFixed(2) + "%",
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "accuracy": accuracy,
    };
}
