import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class AllDone extends StatefulWidget {
  const AllDone({Key? key}) : super(key: key);

  @override
  State<AllDone> createState() => _AllDoneState();
}

class _AllDoneState extends State<AllDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:  Colors.green.withOpacity(0.3),
      body:
      Container(
        color:  Colors.green.withOpacity(0.3),
        height: 1.sh,
        padding: EdgeInsets.only(left: 24.w,right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45.h,),
            SizedBox(height: 100.h,),
            Text("All Done",style: TextStyle(fontSize: 28.sp,color: Colors.black,fontWeight:FontWeight.w900)),
            SizedBox(height: 10.h,),
            Text("Thanks for giving us your precious time. Now you are ready for an enjoyable moment.",style: TextStyle(fontSize: 16.sp,color: Colors.black)),
            SizedBox(height: 50.h,),
            Image(image: AssetImage("assets/images/Saly-18.png"),height: 282.h,fit: BoxFit.cover,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [

                  SizedBox(height: 15.h,),
                //  if(!controller.isSmsCorrect)Text("Wrong",style: TextStyle(color: Colors.red),),
                  SizedBox(height: 61.h,),
                  MaterialButton(onPressed:(){},
                    color:Colors.green,
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
      )
    );
  }
}
