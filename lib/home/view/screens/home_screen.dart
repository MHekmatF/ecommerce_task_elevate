import 'package:ecommerce_task_elevate/home/view/widget/category_widget.dart';
import 'package:ecommerce_task_elevate/product/data/data_source/product_api_data_source.dart';
import 'package:ecommerce_task_elevate/product/view_model/product_state.dart';
import 'package:ecommerce_task_elevate/product/view_model/product_viewmodel.dart';
import 'package:ecommerce_task_elevate/shared/di/service_locator.dart';
import 'package:ecommerce_task_elevate/shared/widgets/error_indicator.dart';
import 'package:ecommerce_task_elevate/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final _productCubit = serviceLocator.get<ProductViewmodel>()..gteProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick your category of products",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(vertical: 40.h),
        child: BlocBuilder<ProductViewmodel,ProductState>(
          bloc: _productCubit,
          builder: (context, state) {
            if(state is GetProductsLoading){
              return LoadingIndicator();
            }else if(state is GetProductsError){
             return ErrorIndicator(state.message);
            }else{
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Expanded(
                  child: GridView.builder(
                    itemCount: CategoryModel.Categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 24,childAspectRatio: 3/5),
                    itemBuilder: (context, index) {
                      return
                        // onTap: () {
                        //   // onCategorySelected(CategoryModel.Categories[index]);
                        // },
                        CategoryWidget(category: CategoryModel.Categories[index], index: index)
                      // CategoryItem(
                      //   category: CategoryModel.Categories[index],
                      //   index: index,
                      // )
                          ;
                    },
                  ),
                ),
              );

            }
          },
        ),
      ),
    );
  }
}
