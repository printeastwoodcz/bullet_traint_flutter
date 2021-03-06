import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../extensions/string_x.dart';
import 'feature.dart';

class Flag extends Equatable {
  final int id;
  final Feature feature;
  final String stateValue;
  final bool enabled;
  @override
  List<Object> get props => [id, feature, stateValue, enabled];
  @override
  bool get stringify => true;
  Flag(
    this.id,
    this.feature,
    this.stateValue,
    this.enabled,
  );
  Flag.named({
    this.id,
    this.feature,
    this.stateValue,
    this.enabled,
  });

  Flag copyWith({
    int id,
    Feature feature,
    String stateValue,
    bool enabled,
  }) {
    return Flag(
      id ?? this.id,
      feature ?? this.feature,
      stateValue ?? this.stateValue,
      enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'feature': feature?.toMap(),
      'feature_state_value': stateValue,
      'enabled': enabled,
    };
  }

  factory Flag.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return Flag(
      map['id'] as int,
      Feature.fromMap(map['feature'] as Map<String, dynamic>),
      map['feature_state_value']?.toString()?.normalize(),
      map['enabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Flag.fromJson(String source) =>
      Flag.fromMap(json.decode(source) as Map<String, dynamic>);

  String get key => feature.name ?? id.toString();
}
