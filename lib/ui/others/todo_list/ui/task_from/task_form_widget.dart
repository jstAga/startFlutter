import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/todo_list/ui/task_from/task_form_model.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key, required this.groupKey});

  final int groupKey;

  @override
  State<TaskFormWidget> createState() => _TaskFormWidget();
}

class _TaskFormWidget extends State<TaskFormWidget> {
  late final TaskFormModel _model;

  @override
  void initState() {
    super.initState();
    _model = TaskFormModel(groupKey: widget.groupKey);
  }

  @override
  Widget build(BuildContext context) {
    return TaskFormModelProvider(
        model: _model, child: const _TaskFormScaffold());
  }
}

class _TaskFormScaffold extends StatelessWidget {
  const _TaskFormScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New task")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: _TaskNameWidget()),
      ),
      floatingActionButton: const _FabWidget(),
    );
  }
}

class _TaskNameWidget extends StatelessWidget {
  const _TaskNameWidget();

  @override
  Widget build(BuildContext context) {
    final model = TaskFormModelProvider.read(context)?.model;
    return TextField(
      expands: true,
      minLines: null,
      maxLines: null,
      autofocus: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Text of the task",
      ),
      onEditingComplete: () => model?.saveTask(context),
      onChanged: (value) => model?.taskText = value,
    );
  }
}

class _FabWidget extends StatelessWidget {
  const _FabWidget();

  @override
  Widget build(BuildContext context) {
    final model = TaskFormModelProvider.read(context)?.model;
    return FloatingActionButton(
      onPressed: () => model?.saveTask(context),
      child: const Icon(Icons.done),
    );
  }
}
