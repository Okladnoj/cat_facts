import 'dart:io';

import 'package:cat_facts/l10n/localization_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/database_manager.dart';
import '../utils/json_parser.dart';

part 'facts.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: HiveManager.factId)
class Fact extends Equatable {
  @JsonKey(name: 'text')
  @HiveField(0)
  final String description;

  @JsonKey(name: 'createdAt', fromJson: JsonParser.stringToDateTime)
  @HiveField(1)
  final DateTime? createdAt;

  String get formattedDate {
    final createdAt = this.createdAt;
    final systemLanguage = Platform.localeName;
    final systemLocale = Locale(systemLanguage);
    final noDateLabel = getLocaleLocalizations(systemLocale).noDateLabel;

    if (createdAt == null) return noDateLabel;

    return DateFormat.MEd(systemLanguage).format(createdAt);
  }

  const Fact({
    required this.description,
    this.createdAt,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);

  @override
  List<Object?> get props => [description, createdAt];
}
