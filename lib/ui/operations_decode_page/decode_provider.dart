import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:ta_calc/models/decoder/decoder_delegate.dart';

import 'package:ta_calc/resources/exceptions.dart';

class DecodeProvider with ChangeNotifier {
  final DecoderDelegate delegate;
  List<String> sources = [];
  List<String> results = [];
  StreamController<bool> _exceptionStream =
      StreamController.broadcast(onListen: () => false);
  Stream<bool> get exceptions => _exceptionStream.stream;
  String exceptionCaption = "";

  DecodeProvider(this.delegate);

  void decode(String number) {
    try {
      if (number.isNotEmpty) {
        var res = delegate.calc(number);
        sources.add(number);
        results.add(res);
      }
    } on InvalidCode catch (e) {
      _exceptionStream.add(true);
      exceptionCaption = e.message;
    } finally {
      notifyListeners();
    }
  }

  void reset() {
    sources.clear();
    results.clear();
    notifyListeners();
  }

  void dispose() {
    _exceptionStream.close();
    super.dispose();
  }
}
