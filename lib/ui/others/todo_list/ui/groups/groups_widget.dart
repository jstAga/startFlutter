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

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => GroupsModelProvider.read(context)?.model.toForm(context),
      child: const Icon(Icons.add),
    );
  }
}

class _GroupListWidget extends StatelessWidget {
  const _GroupListWidget();

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsModelProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
      itemCount: groupsCount,
      itemBuilder: (BuildContext context, int index) {
        return _GroupItemWidget(index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 10);
      },
    );
  }
}

class _GroupItemWidget extends StatelessWidget {
  final int index;

  const _GroupItemWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = GroupsModelProvider.read(context)?.model;
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
            onPressed: (BuildContext context) => model?.deleteGroup(index),
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
          title: Text(model!.groups[index].groupName),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}
