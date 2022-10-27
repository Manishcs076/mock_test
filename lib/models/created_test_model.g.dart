// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_test_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreatedTestModelAdapter extends TypeAdapter<CreatedTestModel> {
  @override
  final int typeId = 1;

  @override
  CreatedTestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreatedTestModel(
      fields[0] as String,
      fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CreatedTestModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.testName)
      ..writeByte(1)
      ..write(obj.createdDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatedTestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
