import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:aiia/model/JeongsiResult.dart';
import 'package:aiia/model/SusiResult.dart';

const BASE_URL = "https://aiia-gcu.github.io/Muhan-giljabi/api/";

final Map<int, List<JeongsiResult>> _jeongsiMemoryCache = {};
final Map<int, List<SusiResult>> _susiMemoryCache = {};


/// 정시 입시 결과 가져오기
Future<List<JeongsiResult>> fetchJeongsiResult(int year) async {
  if (_jeongsiMemoryCache.containsKey(year)) {
    return _jeongsiMemoryCache[year]!;
  } else {
    final response = await http.get(
      Uri.parse("${BASE_URL}result/jeongsi/${year}.json"),
    );
    final List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
    final List<JeongsiResult> deserialized = body.map((value){
      return JeongsiResult.fromJson(value);
    }).toList();
    _jeongsiMemoryCache[year] = deserialized;
    return deserialized;
  }
}

/// 수시 입시 결과 가져오기
Future<List<SusiResult>> fetchSusiResult(int year) async {
  if (_susiMemoryCache.containsKey(year)) {
    return _susiMemoryCache[year]!;
  } else {
    final response = await http.get(
      Uri.parse("${BASE_URL}result/susi/${year}.json"),
    );
    final List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
    final List<SusiResult> deserialized = body.map((value){
      return SusiResult.fromJson(value);
    }).toList();
    _susiMemoryCache[year] = deserialized;
    return deserialized;
  }
}
