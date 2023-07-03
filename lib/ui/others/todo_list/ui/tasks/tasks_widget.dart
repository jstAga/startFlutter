import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:start_flutter/ui/others/todo_list/ui/tasks/tasks_model.dart';

class TasksWidgetConfiguration {
  TasksWidgetConfiguration({required this.groupKey, required this.title});

  final int groupKey;
  final String title;
}

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key, required, required this.configuration});

  final TasksWidgetConfiguration configuration;

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  late final TasksModel _model;

  @override
  void initState() {
    super.initState();
    _model = TasksModel(configuration: widget.configuration);
  }

  @override
  Widget build(BuildContext context) {
    return TasksModelProvider(model: _model, child: const _ScaffoldWidget());
  }
  @override
  void dispose() async {
    super.dispose();
    await _model.dispose();
  }
}

class _ScaffoldWidget extends StatelessWidget {
  const _ScaffoldWidget();

  @override
  Widget build(BuildContext context) {
    final model = TasksModelProvider.watch(context)?.model;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(model?.configuration.title ?? "Tasks")),
        body: const _TasksListWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model?.toForm(context),
          child: const Icon(Icons.add),
        ));
  }
}

class _TasksListWidget extends StatelessWidget {
  const _TasksListWidget();

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        TasksModelProvider.watch(context)?.model.tasks.length ?? 0;
    return ListView.separated(
      itemCount: groupsCount,
      itemBuilder: (BuildContext context, int index) {
        return _TaskItemWidget(index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 10);
      },
    );
  }
}

class _TaskItemWidget extends StatelessWidget {
  final int index;

  const _TaskItemWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = TasksModelProvider.read(context)!.model;
    final task = model.tasks[index];
    final IconData? icon = task.isDone ? Icons.done : null;
    final textStyle = task.isDone
        ? const TextStyle(decoration: TextDecoration.lineThrough)
        : null;

    return Slidable(
      closeOnScroll: false,
      groupTag: "1",
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {},
        ),
        dragDismissible: false,
        children: <Widget>[
          SlidableAction(
            onPressed: (BuildContext context) => model.deleteTask(index),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ColoredBox(
        color: Colors.white,
        child: ListTile(
            title: Text(task.text, style: textStyle),
            trailing: Icon(icon),
            onTap: () => model.doneTask(index)),
      ),
    );
  }
}
