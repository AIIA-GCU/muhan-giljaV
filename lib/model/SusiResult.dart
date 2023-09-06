import 'package:json_annotation/json_annotation.dart';

part 'SusiResult.g.dart';

@JsonSerializable()
class SusiResult {
  /// 모집 단위(학과/학부)
  @JsonKey(required: true)
  final String department;

  /// 모집 전형
  @JsonKey(required: true)
  final String examination;

  /// 경쟁률
  @JsonKey(required: true)
  final double ratio;

  /// 모집 인원
  @JsonKey(required: true)
  final int capacity;

  /// [70%]등급컷(교과 등급)
  @JsonKey(required: true)
  final double cutLine70;

  /// [90%]등급컷(교과 등급)
  @JsonKey(required: true)
  final double cutLine90;

  /// [70%]최종 합격자의 논술 정답 수(15문제 중), 논술 미실시 전형은 -1
  @JsonKey(defaultValue: -1)
  final double essayCutLine70;

  /// [90%]최종 합격자의 논술 정답 수(15문제 중), 논술 미실시 전형은 -1
  @JsonKey(defaultValue: -1)
  final double essayCutLine90;

  /// 최종 합격자의 예비순위
  @JsonKey(required: true)
  final int reverseNumber;

  SusiResult(
      {required this.department,
      required this.examination,
      required this.ratio,
      required this.capacity,
      required this.cutLine70,
      required this.cutLine90,
      required this.essayCutLine70,
      required this.essayCutLine90,
      required this.reverseNumber});

  /// Connect the generated [_$SusiResultFromJson] function to the `fromJson`
  /// factory.
  factory SusiResult.fromJson(Map<String, dynamic> json) =>
      _$SusiResultFromJson(json);

  /// Connect the generated [_$SusiResultToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SusiResultToJson(this);
}
