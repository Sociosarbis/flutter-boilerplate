import 'package:flutter_boilerplate/utils/remote_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Msg", () {
    test("time format is correct", () {
      expect(formatDateTime(DateTime.fromMillisecondsSinceEpoch(1768045733000)),
          "2026-01-10T19:48:53");
    });
  });

  group("RemoteLogger", () {
    test("consume logs", () async {
      var count = 0;
      final logger = RemoteLogger((msgs) async {
        await Future.delayed(const Duration(milliseconds: 200));
        count++;
        print(msgs);
      });
      for (var i = 0; i < 100; i++) {
        logger.add("test", Msg(i.toString()));
      }
      expect(logger.length, 100);
      await Future.delayed(const Duration(seconds: 11));
      expect(logger.length, 0);
      expect(count, 2);
    });

    test("can not consume logs", () async {
      var count = 0;
      final logger = RemoteLogger((msgs) async {
        count++;
        return Future.error(Exception("network error"));
      });
      for (var i = 0; i < 100; i++) {
        logger.add("test", Msg(i.toString()));
      }
      await Future.delayed(const Duration(seconds: 11));
      expect(logger.length, 100);
      expect(count, greaterThanOrEqualTo(3));
    });
  });
}
