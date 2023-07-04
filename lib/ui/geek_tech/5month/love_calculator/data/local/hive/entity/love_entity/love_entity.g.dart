// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'love_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoveEntityAdapter extends TypeAdapter<LoveEntity> {
  @override
  final int typeId = 4;

  @override
  LoveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoveEntity(
      fname: fields[0] as String,
      sname: fields[1] as String,
      percentage: fields[2] as String,
      result: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.fname)
      ..writeByte(1)
      ..write(obj.sname)
      ..writeByte(2)
      ..write(obj.percentage)
      ..writeByte(3)
      ..write(obj.result);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
