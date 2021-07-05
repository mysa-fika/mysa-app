import 'dart:ui';

const Color mysa_primary = const Color(0xFF90CAF9);
const Color mysa_secondary = const Color(0xFFFF8A84);
const Color mysa_contrast = const Color(0xFF021F54);
const Color yellow = const Color(0xFFEBD234);
const Color light_yellow = const Color(0xFFFFF7AD);
const Color green = const Color(0xFF83EB34);
const Color light_green = const Color(0xFFBBFFAD);
const Color red = const Color(0xFFEB3A34);
const Color light_red = const Color(0xFFFFB4AD);
const Color orange = const Color(0xFFEB9F34);
const Color light_orange = const Color(0xFFFFE5AD);

// const List<Color> eventColors = [
//   light_yellow,
//   light_green,
//   light_red,
//   light_orange,
//   mysa_primary
// ];

List<Color> eventColors = [
  mysa_secondary.withOpacity(1),
  mysa_secondary.withOpacity(0.7),
  mysa_secondary.withOpacity(0.4),
  mysa_secondary.withOpacity(0.2),
  mysa_primary.withOpacity(0.2),
  mysa_primary.withOpacity(0.4),
  mysa_primary.withOpacity(0.7),
  mysa_primary.withOpacity(1),
];
