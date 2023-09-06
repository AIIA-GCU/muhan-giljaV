import 'package:json_annotation/json_annotation.dart';

part 'JeongsiResult.g.dart';

@JsonSerializable()
class JeongsiResult {
  /// 모집 단위(학과/학부)
  @JsonKey(required: true)
  final String department;

  /// 모집 전형
  @JsonKey(required: true)
  final String examination;

  /// 모집 군(가/나/다)
  @JsonKey(required: true)
  final String group;

  /// 경쟁률
  @JsonKey(required: true)
  final double ratio;

  /// 모집 인원
  @JsonKey(required: true)
  final int capacity;

  /// 등급컷(백분위)
  @JsonKey(required: true)
  final double cutLine;

  /// 최종 합격자의 예비순위
  @JsonKey(required: true)
  final int reverseNumber;

  JeongsiResult(
      {required this.department,
      required this.examination,
      required this.group,
      required this.ratio,
      required this.capacity,
      required this.cutLine,
      required this.reverseNumber});

  /// Connect the generated [_$JeongsiResultFromJson] function to the `fromJson`
  /// factory.
  factory JeongsiResult.fromJson(Map<String, dynamic> json) =>
      _$JeongsiResultFromJson(json);

  /// Connect the generated [_$JeongsiResultToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$JeongsiResultToJson(this);
}
