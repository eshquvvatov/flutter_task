import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/login_page/login_controller.dart';
import 'package:get/get.dart';

import '../sms_page/task_page.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder<LoginController>(
        init:LoginController() ,
        builder: (controller) {
          return Container(
            color: Colors.green.withOpacity(0.3),
            padding: EdgeInsets.only(left: 24.w,right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100.h,),
                Text("Enter your phone\nnumber",style: TextStyle(fontSize: 28.sp,color: Colors.black,fontWeight:FontWeight.w900)),
                SizedBox(height: 10.h,),
                Text("We're going to send you verification\ncode to confirm your identity",style: TextStyle(fontSize: 16.sp,color: Colors.black)),
                SizedBox(height: 24.h,),
                Container(
                  height: 50,
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.green,width: 2)
                  ),
                  child: Row(children: [
                    Image(image: const AssetImage("assets/images/image.png"),height: 19.h,width: 34.w,), const Icon(Icons.arrow_drop_down_outlined,size: 30,),
                    Expanded(child:  TextField(
                      inputFormatters: [controller.numberMaskForma],
                      keyboardType: TextInputType.number,
                      controller: controller.phoneController,
                      scrollPadding: EdgeInsets.zero,
                      textInputAction: TextInputAction.next,
                      onChanged: (text){
                        print(text);
                        controller.inputNumber=text;
                        controller.activeButton(text);
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        border: InputBorder.none,
                      ),

                    ),)
                  ],),
                ),
                SizedBox(height: 100.h,),
                MaterialButton(onPressed: controller.isActiveButton?(){
                  FocusScope.of(context).unfocus();
                  Get.to(()=>const SmsPage());
                }:(){},
                color:controller.isActiveButton?Colors.green: Colors.grey,
                  height: 56.h,
                  minWidth: 327.w,
                  shape: const StadiumBorder(),
                  child: const Center(child: Text("Verify Phone Number",style: TextStyle(color: Colors.white,fontSize:18 ),),),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
