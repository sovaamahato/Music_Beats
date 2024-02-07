import 'package:flutter/material.dart';

import 'colors.dart';

const bold = "sans_bold";
const regular = "sans_regular";

ourStyle({family = "sans_regular", color = bgColor, double? size = 14}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontFamily: family,
  );
}
