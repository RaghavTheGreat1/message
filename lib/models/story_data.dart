import 'package:flutter/foundation.dart';

@immutable
class StoryData {
  const StoryData({
    required this.name,
    required this.url,
  });
  final String name;
  final String url;
}
