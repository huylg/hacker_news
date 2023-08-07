import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@Freezed()
class Story with _$Story {
  const factory Story({
    required String by,
    int? descendants,
    required int id,
    @Default([]) List<int> kids,
    required int score,
    int? time,
    required String title,
    String? url,
    required String type,
    @Default(false) bool isFavorite,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
