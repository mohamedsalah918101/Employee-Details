import 'package:flutter/material.dart';
import '../model/employee_model.dart';


class EmployeeDetailScreen extends StatelessWidget {
  final User employee;

  const EmployeeDetailScreen({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${employee.firstName} ${employee.lastName}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(employee.image),
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoSection('Personal Information', [
              _buildInfoRow('Full Name', '${employee.firstName} ${employee.lastName}'),
              _buildInfoRow('Email', employee.email),
              _buildInfoRow('Phone', employee.phone),
              _buildInfoRow('Birth Date', employee.birthDate),
              _buildInfoRow('Gender', employee.gender),
            ]),
            const SizedBox(height: 16),
            _buildInfoSection('Company Details', [
              _buildInfoRow('Company', employee.company.name),
              _buildInfoRow('Department', employee.company.department),
              _buildInfoRow('Position', employee.company.title),
            ]),
            const SizedBox(height: 16),
            _buildInfoSection('Address', [
              _buildInfoRow('Street', employee.address.address),
              _buildInfoRow('City', employee.address.city),
              _buildInfoRow('State', employee.address.state),
              _buildInfoRow('Postal Code', employee.address.postalCode),
              _buildInfoRow('Country', employee.address.country),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}