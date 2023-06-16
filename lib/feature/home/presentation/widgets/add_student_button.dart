import 'package:electronic_student_journal/feature/home/presentation/viewmodels/providers/show_student_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddStudentButton extends StatelessWidget {
  const AddStudentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowStudentSearchProvider>(
      builder: (_, showStudentSearchProvider, __) => ElevatedButton(
        onPressed: () => showStudentSearchProvider.toggleVisibility(),
        child: const Text('Add student'),
      ),
    );
  }
}
