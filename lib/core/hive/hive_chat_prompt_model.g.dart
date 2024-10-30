// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_chat_prompt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveChatPromptModelAdapter extends TypeAdapter<HiveChatPromptModel> {
  @override
  final int typeId = 1;

  @override
  HiveChatPromptModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveChatPromptModel(
      id: fields[0] as String,
      systemPrompt: fields[1] as String,
      title: fields[2] as String,
      summary: fields[3] as String,
      topic: fields[4] as String,
      date: fields[5] as DateTime?,
      chat: (fields[6] as List?)?.cast<ChatPromptModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveChatPromptModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.systemPrompt)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.summary)
      ..writeByte(4)
      ..write(obj.topic)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.chat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveChatPromptModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
