import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/todo_list/ui/task_from/task_form_model.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidget();
}

class _TaskFormWidget extends State<TaskFormWidget> {
  TaskFormModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TaskFormModel(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;
    if (model != null) {
      return TaskFormModelProvider(
          model: model, child: const _TaskFormScaffold());
    } else {
      return const Center(
        child: Text("error with tasks"),
      );
    }
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
