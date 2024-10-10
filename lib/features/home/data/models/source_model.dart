
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part  "source_model.g.dart";
@HiveType(typeId: 1)
class SourceModel extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name ;

  SourceModel({required this.id, required this.name});

  @override
  List<Object?> get props =>
      [
        id,
        name
      ]
  ;


}