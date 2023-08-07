// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      by: json['by'] as String?,
      id: json['id'] as int,
      kids: (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      parent: json['parent'] as int?,
      text: json['text'] as String?,
      time: json['time'] as int?,
      descendants: json['descendants'] as int?,
      score: json['score'] as int?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'by': instance.by,
      'id': instance.id,
      'kids': instance.kids,
      'parent': instance.parent,
      'text': instance.text,
      'time': instance.time,
      'descendants': instance.descendants,
      'score': instance.score,
      'type': instance.type,
    };
