// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_story_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoryModelAdapter extends TypeAdapter<HiveStoryModel> {
  @override
  final int typeId = 3;

  @override
  HiveStoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStoryModel(
      id: fields[0] as String,
      title: fields[1] as String,
      topic: fields[3] as String,
      paragraph: (fields[2] as List).cast<String>(),
      date: fields[5] as DateTime?,
      backgroundIndex: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveStoryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.paragraph)
      ..writeByte(3)
      ..write(obj.topic)
      ..writeByte(4)
      ..write(obj.backgroundIndex)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
