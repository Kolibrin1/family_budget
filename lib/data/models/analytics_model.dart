import 'package:flutter/painting.dart';

class AnalyticsData {
  final List<Color> colors;
  final List<String> titles;
  final List<double> totalCounts;
  final double allCount;
  final List<int>? transactionCounts;

  AnalyticsData({
    required this.colors,
    required this.titles,
    required this.totalCounts,
    required this.allCount,
    this.transactionCounts,
  });

  AnalyticsData copyWith({
    List<Color>? colors,
    List<String>? titles,
    List<double>? totalCounts,
    double? allCount,
    List<int>? transactionCounts,
  }) {
    return AnalyticsData(
      colors: colors ?? this.colors,
      titles: titles ?? this.titles,
      totalCounts: totalCounts ?? this.totalCounts,
      allCount: allCount ?? this.allCount,
      transactionCounts: transactionCounts ?? this.transactionCounts,
    );
  }
}