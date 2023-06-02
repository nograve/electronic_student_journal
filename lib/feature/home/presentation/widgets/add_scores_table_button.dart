import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddScoresTableButton extends StatelessWidget {
  const AddScoresTableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            size: 96.r,
          ),
          // Text(
          //   'Add',
          //   style: TextStyle(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.bold,
          //   ),
          // )
        ],
      ),
    );
  }
}
