import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_task_elevate/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CashImage extends StatelessWidget {
  final String path;
  const CashImage({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275.h,
      width: 325.w,
      child: CachedNetworkImage(
        imageUrl: path,
        placeholder: (context, _) {
          return LoadingIndicator();
        },
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },

      ),
    );
  }
}
