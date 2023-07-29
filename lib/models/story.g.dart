// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Story _$$_StoryFromJson(Map<String, dynamic> json) => _$_Story(
      by: json['by'] as String,
      descendants: json['descendants'] as int?,
      id: json['id'] as int,
      kids: (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      score: json['score'] as int,
      title: json['title'] as String,
      url: json['url'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_StoryToJson(_$_Story instance) => <String, dynamic>{
      'by': instance.by,
      'descendants': instance.descendants,
      'id': instance.id,
      'kids': instance.kids,
      'score': instance.score,
      'title': instance.title,
      'url': instance.url,
      'type': instance.type,
    };
