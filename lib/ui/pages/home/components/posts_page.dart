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

class _PostsPageState extends State<PostsPage>
    with AutomaticKeepAliveClientMixin<PostsPage> {
  Widget makePostCard(AsyncSnapshot<List<BlogPostEntity>?> snapshot, int index,
      HomePresenter presenter) {
    return GestureDetector(
      onTap: () {
        presenter.getComments(snapshot.data![index].id.toString());
        widget.onAddButtonTapped(1);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      snapshot.data![index].id!.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      snapshot.data![index].title!,
                      style: TextStyle(
                          color: Color(0xff0064C3),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      snapshot.data![index].body!,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<HomePresenter>(context);
    final height = MediaQuery.of(context).size.height * 1.1;
    super.build(context);
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
                  child: StreamBuilder<List<BlogPostEntity>?>(
                      stream: presenter.postsList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: height),
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    makePostCard(snapshot, index, presenter),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16),
                                itemCount: snapshot.data!.length),
                          );
                        }
                        return Container();
                      }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
