import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/work_with_hive/ui/work_with_hive_model.dart';

class WorkWithHiveWidget extends StatefulWidget {
  const WorkWithHiveWidget({super.key});

  @override
  State<WorkWithHiveWidget> createState() => _WorkWithHiveWidgetState();
}

class _WorkWithHiveWidgetState extends State<WorkWithHiveWidget> {
  final model = WorkWithHiveModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => model.create(),
                child: const Text("Create"),
              ),
              ElevatedButton(
                onPressed: () => model.read(),
                child: const Text("Read"),
              ),
              ElevatedButton(
                onPressed: () => model.delete(),
                child: const Text("Delete"),
              ),
              ElevatedButton(
                onPressed: () => model.clearAll(),
                child: const Text("Clear all"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
