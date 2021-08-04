import 'package:test/test.dart';
import 'naive.dart';

/*
#[test]
fn match_number_letter_number_letter_number() {
    let words = vec![
            "antianthropomorphism".to_string(),
            "institutionalization".to_string(),
            "intercrystallization".to_string(),
            "internationalization".to_string(),
            "internationalizationy".to_string()];
    let mut matches = match_pattern("2t2n14", &words);
    matches.sort();
    assert_eq!(matches, ["antianthropomorphism", "internationalization"]);
}
*/

void main() {
  test('letter number letter number', () {
    var words = ["antianthropomorphism", "institutionalization", "intercrystallization", "internationalization", "internationalizationy"];

    expect(matchPattern("2t2n14", words), equals(["antianthropomorphism", "internationalization"]));
  });

  test('ignores case', () {
    var words = ["Cat", "cat", "cot", "dog"];

    expect(matchPattern("c1t", words), equals(["Cat", "cat", "cot"]));
  });
}