import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:start_flutter/ui/others/todo_list/ui/tasks/tasks_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key, required});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  TasksModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TasksModel(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;
    if (model != null) {
      return TasksModelProvider(model: model, child: const _ScaffoldWidget());
    } else {
      return const Center(
        child: Text("error with tasks"),
      );
    }
  }
}

class _ScaffoldWidget extends StatelessWidget {
  const _ScaffoldWidget();

  @override
  Widget build(BuildContext context) {
    final model = TasksModelProvider.watch(context)?.model;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(model?.group?.groupName ?? "Tasks")),
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
    const groupsCount = 100;
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
    // final model = _TaskItemWidget.read(context)?.model;
    return Slidable(
      closeOnScroll: false,
      groupTag: "0",
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {},
        ),
        dragDismissible: false,
        children: <Widget>[
          SlidableAction(
            onPressed: (BuildContext context) {},
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
            title: const Text("d"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {}),
      ),
    );
  }
}
