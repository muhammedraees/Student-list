import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_student/db/functions/db_functions.dart';
import 'package:hive_student/db/model/data_model.dart';
import 'package:hive_student/screens/widgets/details_student.dart';
class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return Container(
              height: 70,
              child: Card(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    backgroundImage: FileImage(
                      File(data.photo),
                    ),
                  ),
                  title: Text(data.name),
                  trailing: IconButton(
                    onPressed: () {
                      deleteStudent(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentDetails(
                          name: data.name,
                          age: data.age,
                          mobile: data.mobile,
                          school: data.school,
                          index: index,
                          photo: data.photo,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
