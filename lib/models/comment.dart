import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@Freezed()
class Comment with _$Comment {
  const factory Comment({
    String? by,
    required int id,
    @Default([]) List<int> kids,
    int? parent,
    String? text,
    int? time,
    int? descendants,
    int? score,
    required String type,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
