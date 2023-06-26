import 'package:flutter/material.dart';

class GroupFormWidget extends StatelessWidget {
  const GroupFormWidget({super.key});

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
    return const TextField(
      maxLines: 1,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        helperText: "Name of group",
      ),
    );
  }
}

class _FabWidget extends StatelessWidget {
  const _FabWidget();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.done),
    );
  }
}
