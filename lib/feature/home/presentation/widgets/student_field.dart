import 'package:flutter/material.dart';

class StudentField extends StatelessWidget {
  const StudentField({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: const [],
      onChanged: (a) {},
    );
  }
}
