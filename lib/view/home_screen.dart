import 'package:employee_details/view/widgets/employee_list.dart';
import 'package:flutter/material.dart';

import '../model/employee_model.dart';
import '../service/employee_service.dart';
import '../utils/cache_manager.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final EmployeeService _employeeService = EmployeeService();
  final CacheManager _cacheManager = CacheManager();
  List<User> _employees = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadEmployees();
  }

  Future<void> _loadEmployees() async {
    try {
      // Try to load cached data first
      final cachedEmployees = await _cacheManager.getCachedEmployees();
      if (cachedEmployees.isNotEmpty) {
        setState(() {
          _employees = cachedEmployees;
          _isLoading = false;
        });
      }

      // Fetch fresh data from API
      final freshEmployees = await _employeeService.fetchEmployees();
      await _cacheManager.cacheEmployees(freshEmployees);

      setState(() {
        _employees = freshEmployees;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshEmployees() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });
    await _loadEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshEmployees,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _error,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _refreshEmployees,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshEmployees,
      child: EmployeeList(employees: _employees),
    );
  }
}