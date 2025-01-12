import 'package:flutter/material.dart';
import '../../model/employee_model.dart';


class EmployeeListItem extends StatelessWidget {
  final User employee;
  final VoidCallback onTap;

  const EmployeeListItem({
    super.key,
    required this.employee,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(employee.image),
          radius: 30,
        ),
        title: Text(
          '${employee.firstName} ${employee.lastName}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(employee.company.title),
            Text(
              employee.company.department,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}