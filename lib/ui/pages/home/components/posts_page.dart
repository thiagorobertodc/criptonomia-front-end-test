import 'package:criptonomia/domain/entities/blog_post_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages.dart';
import '../../../components/components.dart';

class PostsPage extends StatefulWidget {
  final void Function(int) onAddButtonTapped;
  const PostsPage(this.onAddButtonTapped);
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  Widget makePostCard(
      AsyncSnapshot<List<BlogPostEntity>?> snapshot, int index) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                Text(
                  snapshot.data![index].title!,
                )
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<HomePresenter>(context);
    final height = MediaQuery.of(context).size.height * 1.1;
    return Scaffold(
      appBar: PageHeader.getAppBar('Posts', context),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Container(
                height: constraints.maxHeight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    final currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StreamBuilder<List<BlogPostEntity>?>(
                          stream: presenter.postsList,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ConstrainedBox(
                                constraints: BoxConstraints(maxHeight: height),
                                child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        makePostCard(snapshot, index),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 16),
                                    itemCount: snapshot.data!.length),
                              );
                            }
                            return Container();
                          }),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
