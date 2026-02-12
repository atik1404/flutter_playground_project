import 'package:json_annotation/json_annotation.dart';

const apiParamsAnnotation = JsonSerializable(
  createFactory: false,
  createToJson: true,
  explicitToJson: true,
);
