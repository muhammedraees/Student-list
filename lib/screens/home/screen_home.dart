

import 'package:flutter/material.dart';
import 'package:hive_student/db/functions/db_functions.dart';
import 'package:hive_student/screens/widgets/add_student.dart';
import 'package:hive_student/screens/widgets/list_student.dart';
import 'package:hive_student/screens/widgets/search_student.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    getAllStudent();
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: Search(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
      ),
      body: const SafeArea(
        child: ListStudentWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddStudentWidget(),
              
            ),
          );
        },
        // child: const Icon(Icons.add),
        child: Text('Add'),
      ),
      
    );
  }
}