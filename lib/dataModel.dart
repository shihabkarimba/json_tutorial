

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dataModel.g.dart';

@JsonSerializable(explicitToJson: true,includeIfNull: false)
class PostModel extends Equatable{
  final int? id;
  final int? usetId;
  final String? title;
  final String? body;
  
  PostModel({
    required this.id,
    required this.usetId,
    required this.title,
    required this.body
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();



  
  }