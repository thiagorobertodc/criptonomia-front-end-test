import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage(this.presenter);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  final PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await widget.presenter.getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => widget.presenter,
      child: PageView(
        onPageChanged: _increaseValue,
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          PostsPage(onAddButtonTapped),
          CommentsPage(onAddButtonTapped),
          UsersPage(onAddButtonTapped),
          UserDetailPage(onAddButtonTapped),
        ],
      ),
    );
  }

  void _increaseValue(int page) {
    setState(() {
      index = page + 1;
    });
  }

  void onAddButtonTapped(int index) {
    setState(() {
      controller.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    });
  }
}
