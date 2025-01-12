import 'package:flutter/material.dart';

import '../../model/employee_model.dart';
import '../employee_details.dart';
import 'employee_list_item.dart';


class EmployeeList extends StatelessWidget {
  final List<User> employees;

  const EmployeeList({
    super.key,
    required this.employees,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];
        return EmployeeListItem(
          employee: employee,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmployeeDetailScreen(employee: employee),
              ),
            );
          },
        );
      },
    );
  }
}