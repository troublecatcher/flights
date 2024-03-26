// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransferAdapter extends TypeAdapter<Transfer> {
  @override
  final int typeId = 1;

  @override
  Transfer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transfer(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
      fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Transfer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.airport)
      ..writeByte(3)
      ..write(obj.arrival)
      ..writeByte(4)
      ..write(obj.departure);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransferAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
