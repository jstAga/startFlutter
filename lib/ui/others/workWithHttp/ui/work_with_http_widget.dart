import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/workWithHttp/ui/work_with_http_model.dart';

class WorkWithHttpWidget extends StatefulWidget {
  const WorkWithHttpWidget({super.key});

  @override
  State<WorkWithHttpWidget> createState() => _WorkWithHttpWidgetState();
}

class _WorkWithHttpWidgetState extends State<WorkWithHttpWidget> {
  final model = WorkWithHttpModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WorkWithHttpProvider(
          model: model,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_CreateButton(), _ReloadButton(), _PostsWidget()],
          ),
        ),
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            WorkWithHttpProvider.read(context)?.model.reloadPosts(),
        child: const Text("Reload"));
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => WorkWithHttpProvider.read(context)
            ?.model
            .createPosts(title: "title", body: "body"),
        child: const Text("Create"));
  }
}

class _PostsWidget extends StatelessWidget {
  const _PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
            itemCount:
                WorkWithHttpProvider.watch(context)?.model.posts.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return _PostItemWidget(index: index);
            }),
      ),
    );
  }
}

class _PostItemWidget extends StatelessWidget {
  final int index;

  const _PostItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final post = WorkWithHttpProvider.read(context)!.model.posts[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(post.id.toString()),
        const SizedBox(height: 10),
        Text(post.title),
        const SizedBox(height: 10),
        Text(post.body),
      ],
    );
  }
}
