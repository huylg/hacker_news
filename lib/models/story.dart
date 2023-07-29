import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@Freezed()
class Story with _$Story {
  const factory Story({
    required String by,
    int? descendants,
    required int id,
    List<int>? kids,
    required int score,
    // required DateTime time,
    required String title,
    String? url,
    required String type,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}