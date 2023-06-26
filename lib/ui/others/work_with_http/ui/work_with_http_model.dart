import 'package:flutter/cupertino.dart';
import 'package:start_flutter/ui/others/work_with_http/data/api_client/api_client.dart';
import 'package:start_flutter/ui/others/work_with_http/data/entity/post/post.dart';

class WorkWithHttpModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _posts = <Post>[];

  List<Post> get posts => _posts;

  Future<void> reloadPosts() async {
    _posts += await apiClient.getPosts();
    notifyListeners();
  }

  Future<void> createPosts({required String title, required String body}) async{
    await apiClient.createPost(title: title, body: body);
  }
}

class WorkWithHttpProvider extends InheritedNotifier {
  final WorkWithHttpModel model;

  const WorkWithHttpProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(child: child, notifier: model);

  static WorkWithHttpProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WorkWithHttpProvider>();
  }

  static WorkWithHttpProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<WorkWithHttpProvider>()
        ?.widget;
    return widget is WorkWithHttpProvider ? widget : null;
  }
}
