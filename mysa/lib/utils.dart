import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mysa/colors.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;
  final Color fill;

  const Event(this.title, this.fill);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

var rng = new Random();

final _kEventSource = Map.fromIterable(
  List.generate(97, (index) => index),
  key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item),
  value: (item) => List.generate(
    3,
    (index) => Event(
      'Lala $item | ${index + 1}',
      eventColors[(index + rng.nextInt(200)) % 8],
    ),
  ),
)..addAll({
    kToday: [
      Event(
        'Morning walk',
        mysa_secondary.withOpacity(0.7),
      ),
      Event(
        'Lunch with friends',
        mysa_primary.withOpacity(0.2),
      ),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
