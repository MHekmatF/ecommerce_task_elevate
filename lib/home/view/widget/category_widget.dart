import 'package:ecommerce_task_elevate/product/view/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text(category.title,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
        SizedBox(height: 10,),
        Expanded(
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),

                image:DecorationImage(image:AssetImage(

                    "images/${category.imageName}",

                ),fit: BoxFit.cover ) ,

              ),
            ),
            onTap: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  return ProductScreen(categoryName: category.id);
},));
            },
          ),
        ),
      ],
    );
  }
}
