// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TravelEventAdapter extends TypeAdapter<TravelEvent> {
  @override
  final int typeId = 0;

  @override
  TravelEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TravelEvent(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TravelEvent obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.airport)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
