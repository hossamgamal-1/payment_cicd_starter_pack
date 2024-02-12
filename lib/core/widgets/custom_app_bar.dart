import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extenstions.dart';
import '../helpers/svg_helper.dart';
import '../utils/styles.dart';

AppBar buildAppBar(BuildContext context, {final String? title}) {
  return AppBar(
    leading: Center(
      child: InkWell(
        onTap: () => context.pop(),
        child: SvgHelper.arrow,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
