import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../data/model/collection_data_model.dart';
import '../collection_widget/collection_body_content.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  List<CollectionDataModel> collectionDataList = [];
  @override
  void initState() {
    collectionDataList.addAll(CollectionDataModel.collectionDataList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: collectionBodyContent(context, collectionDataList),
    );
  }
}
