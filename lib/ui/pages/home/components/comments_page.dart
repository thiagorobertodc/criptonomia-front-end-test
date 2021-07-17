import 'package:criptonomia/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages.dart';
import '../../../components/components.dart';

class CommentsPage extends StatefulWidget {
  final void Function(int) onAddButtonTapped;
  const CommentsPage(this.onAddButtonTapped);
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  Widget makeCommentCard(
      AsyncSnapshot<List<PostCommentEntity>?> snapshot, int index) {
    return Stack(
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
                    snapshot.data![index].name!,
                    style: TextStyle(
                        color: Color(0xff0064C3),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    snapshot.data![index].email!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    snapshot.data![index].body!,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
      appBar: PageHeader.getAppBar(
          'Comentários - ', context, widget.onAddButtonTapped, 0),
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
                  child: StreamBuilder<List<PostCommentEntity>?>(
                      stream: presenter.commentsList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: height),
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    makeCommentCard(snapshot, index),
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
}
