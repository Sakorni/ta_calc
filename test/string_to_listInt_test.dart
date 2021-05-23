import 'package:flutter_test/flutter_test.dart';
import 'package:ta_calc/models/decoder/list_to_code_decoder.dart';

void main() {
  ListToCodeDecoder decoder = ListToCodeDecoder();
  test("decoding", () {
    expect(
      decoder.decode(
        "[1, 2, 3]",
      ),
      [1, 2, 3],
    );
    expect(
      decoder.decode(
        "1, 2, 3",
      ),
      [1, 2, 3],
    );
    expect(
      decoder.decode(
        "1, 02, 3, 0",
      ),
      [1, 2, 3, 0],
    );
  });
}
