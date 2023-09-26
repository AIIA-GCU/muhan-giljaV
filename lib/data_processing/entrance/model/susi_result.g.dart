// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'susi_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SusiResult _$SusiResultFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'department',
      'examination',
      'ratio',
      'capacity',
      'cutLine70',
      'cutLine90',
      'reverseNumber'
    ],
  );
  return SusiResult(
    department: json['department'] as String,
    examination: json['examination'] as String,
    ratio: (json['ratio'] as num).toDouble(),
    capacity: json['capacity'] as int,
    cutLine70: (json['cutLine70'] as num).toDouble(),
    cutLine90: (json['cutLine90'] as num).toDouble(),
    essayCutLine70: (json['essayCutLine70'] as num?)?.toDouble() ?? -1,
    essayCutLine90: (json['essayCutLine90'] as num?)?.toDouble() ?? -1,
    reverseNumber: json['reverseNumber'] as int,
  );
}

Map<String, dynamic> _$SusiResultToJson(SusiResult instance) =>
    <String, dynamic>{
      'department': instance.department,
      'examination': instance.examination,
      'ratio': instance.ratio,
      'capacity': instance.capacity,
      'cutLine70': instance.cutLine70,
      'cutLine90': instance.cutLine90,
      'essayCutLine70': instance.essayCutLine70,
      'essayCutLine90': instance.essayCutLine90,
      'reverseNumber': instance.reverseNumber,
    };
