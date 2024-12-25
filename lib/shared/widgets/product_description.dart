import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (description.length > 40) {
          _showFullDescription(context, description);
        }
      },
      child: RichText(maxLines: 2,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Description: ",
              style:  TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black,fontSize: 26.sp),
            ),
            TextSpan(
              text: description.length > 50
                  ? "${description.substring(0, 37)}..."
                  : description,
              style:  TextStyle(color: Colors.black,fontSize: 24.sp),
            ),
          ],
        ),
      ),
    );
  }

  void _showFullDescription(BuildContext context, String description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Full Description"),
        content: SingleChildScrollView(
          child: Text(description),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
