import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/todo_list/ui/group_form/group_form_model.dart';

class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({super.key});

  @override
  State<GroupFormWidget> createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  final _model = GroupFormModel();

  @override
  Widget build(BuildContext context) {
    return GroupFormModelProvider(
      model: _model,
      child: const _GroupFormScaffold(),
    );
  }
}

class _GroupFormScaffold extends StatelessWidget {
  const _GroupFormScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New group")),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: _GroupNameWidget()),
        ),
      ),
      floatingActionButton: const _FabWidget(),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget();

  @override
  Widget build(BuildContext context) {
    final model = GroupFormModelProvider.read(context)?.model;
    return TextField(
      maxLines: 1,
      autofocus: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        helperText: "Name of group",
      ),
      onEditingComplete: () => model?.saveGroup(context),
      onChanged: (value) => model?.groupName = value,
    );
  }
}

class _FabWidget extends StatelessWidget {
  const _FabWidget();

  @override
  Widget build(BuildContext context) {
    final model = GroupFormModelProvider.read(context)?.model;
    return FloatingActionButton(
      onPressed: () => model?.saveGroup(context),
      child: const Icon(Icons.done),
    );
  }
}
