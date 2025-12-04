import 'package:flutter/material.dart';

extension TextStyleCustom on TextStyle {
  TextStyle textLargerCustom({required Color cor}) {
    return TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: cor);
  }

  TextStyle textMediumCustom({required Color cor}) {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: cor);
  }
}
