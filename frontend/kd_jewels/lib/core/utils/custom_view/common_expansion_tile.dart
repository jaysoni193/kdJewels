import 'package:flutter/material.dart';
import 'package:kd_jewels/core/constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonExpansionTile extends StatefulWidget {
  final String text;
  final Function()? onTap;
  const CommonExpansionTile({super.key,required this.text, this.onTap});

  @override
  State<CommonExpansionTile> createState() => _CommonExpansionTileState();
}

class _CommonExpansionTileState extends State<CommonExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // optional: tile background
        borderRadius: BorderRadius.circular(4),
      ),
      child: ExpansionTile(
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        dense: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        minTileHeight: 40.0,
        title: GestureDetector(
          onTap: widget.onTap,
          child: Text(
           widget.text,
            style: AppTextStyles.medium,
          ),
        ),
        childrenPadding: EdgeInsets.zero,
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 13.0.sp,
        ),
      ),
    );
  }
}
