import 'package:ecommerce_task_elevate/main.dart';
import 'package:ecommerce_task_elevate/product/view/widgets/product_widget.dart';
import 'package:ecommerce_task_elevate/product/view_model/product_viewmodel.dart';
import 'package:ecommerce_task_elevate/shared/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.categoryName});
final String categoryName;
  @override
  Widget build(BuildContext context) {
    final _productCubit = serviceLocator.get<ProductViewmodel>();
    final selectedCategory=
    _productCubit.products!.where((element) {
    return  element.category==categoryName;
    },).toList();

    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 30.h),
                child: Text(
                  "Pick your products",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.h,),
              Expanded(
                child: GridView.builder(
                  itemCount: selectedCategory.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 10,childAspectRatio: 4/6),
                  itemBuilder: (context, index) {
                    return
                      ProductWidget(product: selectedCategory[index],)

                        ;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
