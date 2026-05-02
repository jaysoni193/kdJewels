import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatelessWidget {

  const CustomImagePicker({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        customBorder: const CircleBorder(side: BorderSide.none),
        onTap: () async{
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(source: ImageSource.gallery);
            if (image != null) {}
        },
        child: Stack(
          children: [
            Image.asset(
              AppAssets.icUploadImgIcon,
              fit: BoxFit.cover,
              height: 130.h,
              width: 130.w,
            ),
          ],
        ),
      ),
    );
  }

}
