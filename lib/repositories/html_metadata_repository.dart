import 'dart:isolate';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class HtmlMetadataRepository {
  Future<String> getHtmlMetadata(String url) => http
      .get(Uri.parse(url))
      .then((value) => value.body)
      .then((value) => Isolate.run(() => parse(value)))
      .then((value) => value.getElementsByTagName('meta'))
      .then((value) => value.firstWhere(
          (element) => element.attributes['property'] == 'og:image'))
      .then((value) => value.attributes['content']!);
}
