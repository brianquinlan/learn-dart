import 'dart:io';
import 'dart:convert';
import 'dart:async';

List<String>? matchPattern(String pattern, List<String> words) {
  var exp = "";
  var number = "";
  final digit = new RegExp(r"\d");

  for (var i = 0; i < pattern.length; ++i) {
    if (digit.hasMatch(pattern[i])) {
      number += pattern[i];
    } else {
      if (number.length > 0) {
        exp += r"." * int.parse(number);
        number = "";
      }
      exp += pattern[i];
    }
  }
  if (number.length > 0) {
    exp += r"." * int.parse(number);
  }

  final re = new RegExp(r"^" + exp + r"$", caseSensitive: false);
  print(re);
  final List<String> results = [];
  for (var word in words) {
    if (re.hasMatch(word)) {
      results.add(word);
    }
  }
  return results;
}

void main() async {
  final file = File('/usr/share/dict/words');
  List<String> words = [];
  Stream<String> lines = file.openRead()
    .transform(utf8.decoder)       // Decode bytes to UTF-8.
    .transform(LineSplitter());    // Convert stream to individual lines.
    
  try {
    await for (var line in lines) {
      line = line.trim();
      if (line.length > 0) {
        words.add(line);
      }
    }
  } catch (e) {
    print('Error: $e');
  }

  await for (var pattern in stdin.transform(utf8.decoder).transform(LineSplitter())) {
    print(matchPattern(pattern, words));
  }
}