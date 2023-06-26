import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:start_flutter/ui/others/todo_list/ui/groups/groups_model.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({super.key});

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final _model = GroupsModel();

  @override
  Widget build(BuildContext context) {
    return GroupsModelProvider(model: _model, child: const _ScaffoldWidget());
  }
}

class _ScaffoldWidget extends StatelessWidget {
  const _ScaffoldWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Groups")),
      body: const _GroupListWidget(),
      floatingActionButton: const _FabWidget(),
    );
  }
}

class _FabWidget extends StatelessWidget {
  const _FabWidget();

  void toForm(BuildContext context) {
    Navigator.pushNamed(context, "/todoList/groupForm");
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => toForm(context),
      child: const Icon(Icons.add),
    );
  }
}

class _GroupListWidget extends StatefulWidget {
  const _GroupListWidget();

  @override
  State<_GroupListWidget> createState() => _GroupListWidgetState();
}

class _GroupListWidgetState extends State<_GroupListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _GroupItemWidget(
            index: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 10);
        },
        itemCount: 100);
  }
}

class _GroupItemWidget extends StatelessWidget {
  final int index;

  const _GroupItemWidget({required this.index});

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
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
            onPressed: doNothing,
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
          title: Text("$index"),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}
