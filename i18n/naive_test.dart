import 'package:test/test.dart';
import 'naive.dart';

void main() {
  test('number only', () {
    var words = ["cat", "glow", "slow", "cow", "your"];

    expect(matchPattern("4", words), equals(["glow", "slow", "your"]));
  });

  test('number only no match', () {
    var words = ["cat", "glow", "slow", "cow", "your"];

    expect(matchPattern("7", words), equals([]));
  });

  test('letters only', () {
    var words = ["cat", "glow", "slow", "cow", "your"];

    expect(matchPattern("glow", words), equals(["glow"]));
  });

  test('letters only no match', () {
    var words = ["cat", "glow", "slow", "cow", "your"];

    expect(matchPattern("slim", words), equals([]));
  });

  test('letters number letter', () {
    var words = ["cat", "glow", "slow", "cow", "cot"];

    expect(matchPattern("c1t", words), equals(["cat", "cot"]));
  });

  test('letter number letter number', () {
    var words = [
      "antianthropomorphism",
      "institutionalization",
      "intercrystallization",
      "internationalization",
      "internationalizationy"
    ];

    expect(matchPattern("2t2n14", words),
        equals(["antianthropomorphism", "internationalization"]));
  });

  test('ignores case', () {
    var words = ["Cat", "cat", "cot", "dog"];

    expect(matchPattern("c1t", words), equals(["Cat", "cat", "cot"]));
  });
}
