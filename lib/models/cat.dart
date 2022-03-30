import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/database_manager.dart';
import 'facts.dart';

part 'cat.g.dart';

@JsonSerializable(includeIfNull: true)
@HiveType(typeId: HiveManager.catId)
class Cat extends Equatable {
  @HiveField(0)
  final String imageUrl;

  @HiveField(1)
  final Fact fact;

  const Cat({
    required this.imageUrl,
    required this.fact,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return _$CatFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CatToJson(this);

  @override
  List<Object?> get props => [imageUrl, fact];
}
