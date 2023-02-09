import 'package:flutter/material.dart';
import 'package:flutter_task/all_done.dart';
import 'package:flutter_task/sms_page/task_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class SmsPage extends StatefulWidget {
  const SmsPage({Key? key}) : super(key: key);

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:  Colors.green.withOpacity(0.3),
      body:
      GetBuilder<SmsController>(
        init:SmsController() ,
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              color:  Colors.green.withOpacity(0.3),
              height: 1.sh,
              padding: EdgeInsets.only(left: 24.w,right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h,),
                  SizedBox(height: 56,child: Row(children: [IconButton(onPressed: (){Get.back();}, icon:const Icon(Icons.arrow_back_sharp))],),),
                  SizedBox(height: 100.h,),
                  Text("Create your pin code",style: TextStyle(fontSize: 28.sp,color: Colors.black,fontWeight:FontWeight.w900)),
                  SizedBox(height: 10.h,),
                  Text("Create a 4 - digit PIN code that will be used\nevery time you login",style: TextStyle(fontSize: 16.sp,color: Colors.black)),
                  SizedBox(height: 24.h,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: PinCodeTextField(
                             controller: controller.pinCodeController,
                            textStyle: const TextStyle(fontSize: 25),
                            keyboardType: TextInputType.number,
                            length: 4,
                            obscureText: true,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              selectedColor: Colors.green,
                              selectedFillColor: Colors.green,
                              fieldOuterPadding: EdgeInsets.zero,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(12),
                              activeColor: Colors.green,
                              errorBorderColor: Colors.red,
                              inactiveColor: Colors.green,
                              inactiveFillColor: Colors.white,
                              fieldHeight: 60,
                              fieldWidth: 57,
                              activeFillColor: Colors.white,
                            ),
                            animationDuration:
                            const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            onCompleted: (v) {},
                            onChanged: (value) {
                              print(value);
                              controller.activeButton(value);
                              // controller.code = value;
                              // controller.update();
                            },
                            appContext: context,
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        if(!controller.isSmsCorrect)Text("Wrong",style: TextStyle(color: Colors.red),),
                        SizedBox(height: 61.h,),
                        MaterialButton(onPressed: controller.isSmsCorrect?(){
                          controller.pinCodeController.clear();
                          FocusScope.of(context).unfocus();
                          Get.to(()=>const AllDone());
                        }:(){},
                          color:controller.isSmsCorrect?Colors.green: Colors.grey,
                          height: 56.h,
                          minWidth: 327.w,
                          shape: const StadiumBorder(),
                          child: const Center(child: Text("Verify Phone Number",style: TextStyle(color: Colors.white,fontSize:18 ),),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
