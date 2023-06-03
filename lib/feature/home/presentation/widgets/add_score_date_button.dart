import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddScoreDateButton extends StatelessWidget {
  const AddScoreDateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      ),
      child: Icon(
        Icons.add,
        size: 16.r,
      ),
    );
  }
}
