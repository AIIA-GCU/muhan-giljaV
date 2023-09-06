// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JeongsiResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JeongsiResult _$JeongsiResultFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'department',
      'examination',
      'group',
      'ratio',
      'capacity',
      'cutLine',
      'reverseNumber'
    ],
  );
  return JeongsiResult(
    department: json['department'] as String,
    examination: json['examination'] as String,
    group: json['group'] as String,
    ratio: (json['ratio'] as num).toDouble(),
    capacity: json['capacity'] as int,
    cutLine: (json['cutLine'] as num).toDouble(),
    reverseNumber: json['reverseNumber'] as int,
  );
}

Map<String, dynamic> _$JeongsiResultToJson(JeongsiResult instance) =>
    <String, dynamic>{
      'department': instance.department,
      'examination': instance.examination,
      'group': instance.group,
      'ratio': instance.ratio,
      'capacity': instance.capacity,
      'cutLine': instance.cutLine,
      'reverseNumber': instance.reverseNumber,
    };
