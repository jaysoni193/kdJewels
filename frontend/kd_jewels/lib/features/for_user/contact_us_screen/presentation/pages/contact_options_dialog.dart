import 'package:flutter/material.dart';
import '../../../../../core/extensions/navigation_extension.dart';
import '../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

Widget contactOptionsDialog(BuildContext context, VoidCallback onClose) {
  return Dialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    insetPadding: EdgeInsets.zero,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Dismiss when tapping outside
        IgnorePointer(
          ignoring: true,
          child: Container(
            color: Colors.black54,
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 100.0, right: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildActionButton(Icons.phone, "Call Us", () {
                // Call logic
              }),
              SizedBox(height: 12),
              _buildActionButton(Icons.chat, "Live Chat", () {
                // Chat logic
              }),
              SizedBox(height: 12),
              _buildActionButton(Icons.email, "Email Us", () {
                // Email logic
              }),
              SizedBox(height: 12),
              _buildActionButton(Icons.close, "", () {
                onClose();
                context.popScreen();
              }),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        label,
        style: AppTextStyles.medium.copyWith(color: AppColors.whiteColor,),
      ),
      12.0.wSpace,
      FloatingActionButton(
        onPressed: onTap,
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          icon,
          color: AppColors.primaryColor,
        ),
      )
    ],
  );
}
