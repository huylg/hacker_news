String timeago(DateTime time) {
  final duration = time.difference(DateTime.now()).abs();
  final inSeconds = duration.inSeconds;
  final inMinutes = duration.inMinutes;
  final inHours = duration.inHours;
  final inDays = duration.inDays;

  if (inSeconds < 60) {
    return '${inSeconds}s ago';
  } else if (inMinutes < 60) {
    return '${inMinutes}m ago';
  } else if (inHours < 60) {
    return '${inHours}h ago';
  } else {
    return '${inDays}d ago';
  }
}
