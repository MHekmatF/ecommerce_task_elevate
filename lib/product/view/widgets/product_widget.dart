import 'package:ecommerce_task_elevate/product/data/models/product_response/product_response.dart';
import 'package:ecommerce_task_elevate/shared/widgets/product_description.dart';
import 'package:ecommerce_task_elevate/shared/widgets/cash_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.product});

  final ProductResponse product;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

bool? isFavourite;
class _ProductWidgetState extends State<ProductWidget> {
  @override
  void initState() {
   isFavourite = false;
    super.initState();
  }
  @override
  void dispose() {
    isFavourite = false;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF004182),
          width: 1
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                CashImage(path: widget.product.image ?? ""),
                Positioned(
                  right: 0.w,
                  top: 0.h,
                  child: Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: InkWell(splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            isFavourite == true
                                ? isFavourite = false
                                : isFavourite = true;
                          });
                        },
                        child: isFavourite == false
                            ? Icon(
                                size: 40.sp,
                                Icons.favorite_border_outlined,
                                color: Colors.blue,
                              )
                            : Icon(
                                Icons.favorite,
                                size: 40.sp,
                                color: Colors.red,
                              ),
                      )),
                )
              ],
            ),
          ),
          RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Title: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 26.sp),
                ),
                TextSpan(
                  text: widget.product.title ?? "",
                  style: TextStyle(color: Colors.black, fontSize: 24.sp),
                ),
              ],
            ),
          ),
          ProductDescription(description: widget.product.description ?? ""),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Price: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 26.sp),
                        ),
                        TextSpan(
                          text: "${widget.product.price} \$",
                          style:
                              TextStyle(color: Colors.black, fontSize: 24.sp),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Rate: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 26.sp),
                            ),
                            TextSpan(
                              text: "[${widget.product.rating?.rate}]",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 24.sp),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 40.sp,
                      )
                    ],
                  ),
                ],
              ),
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: Color(0xFF004182),
                  shape: BoxShape.circle

                ),
                  child: InkWell(
                      onTap: () {},
                      child: Icon(size: 50.sp,
                        Icons.add,
                        color: Colors.white,
                      )))
            ],
          )
        ],
      ),
    );
  }
}
