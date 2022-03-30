// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactAdapter extends TypeAdapter<Fact> {
  @override
  final int typeId = 1;

  @override
  Fact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fact(
      description: fields[0] as String,
      createdAt: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Fact obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      description: json['text'] as String,
      createdAt: JsonParser.stringToDateTime(json['createdAt'] as String?),
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'text': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
