import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget authHeader() {
  return Column(
    children: [
      SvgPicture.asset(
        appIcon,
        width: 180,
      ),
      const SizedBox(
        height: 16,
      ),
      const Text(
        "Human Resource Mangement",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    ],
  );
}

