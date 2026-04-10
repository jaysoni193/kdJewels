import 'package:flutter/cupertino.dart';

extension SizeBoxHelper on double {
  SizedBox get hSpace => SizedBox(
        height: this,
      );
  SizedBox get wSpace => SizedBox(
        width: this,
      );
}

