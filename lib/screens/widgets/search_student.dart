import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_student/db/functions/db_functions.dart';
import 'package:hive_student/db/model/data_model.dart';
import 'package:hive_student/screens/widgets/details_student.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => StudentDetails(
                            name: data.name,
                            age: data.age,
                            index: index,
                            photo: data.photo,
                            school: data.school,
                            mobile: data.mobile,
                          ),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(data.photo)),
                    ),
                  ),
                  const Divider(),
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (data.name.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(ctx).push(
                        MaterialPageRoute(
                          builder: (context) => StudentDetails(
                            age: data.age,
                            index: index,
                            name: data.name,
                            mobile: data.mobile,
                            photo: data.photo,
                            school: data.school,
                          ),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(File(data.photo)),
                    ),
                  ),
                  const Divider(),
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentList.length,
        );
      },
    );
  }


}