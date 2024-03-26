// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlightAdapter extends TypeAdapter<Flight> {
  @override
  final int typeId = 2;

  @override
  Flight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Flight(
      departure: fields[0] as TravelEvent?,
      arrival: fields[1] as TravelEvent?,
      transfers: (fields[2] as List).cast<Transfer>(),
      plans: (fields[3] as List?)?.cast<Plan>(),
    );
  }

  @override
  void write(BinaryWriter writer, Flight obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.departure)
      ..writeByte(1)
      ..write(obj.arrival)
      ..writeByte(2)
      ..write(obj.transfers)
      ..writeByte(3)
      ..write(obj.plans);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlightAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
