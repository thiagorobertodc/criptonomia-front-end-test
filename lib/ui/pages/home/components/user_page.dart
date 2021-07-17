import 'package:criptonomia/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages.dart';
import '../../../components/components.dart';

class UsersPage extends StatefulWidget {
  final void Function(int) onAddButtonTapped;
  const UsersPage(this.onAddButtonTapped);
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage>
    with AutomaticKeepAliveClientMixin<UsersPage> {
  Widget makeUserCard(AsyncSnapshot<List<UserEntity>?> snapshot, int index,
      HomePresenter presenter) {
    return GestureDetector(
      onTap: () async {
        await presenter.setIndex(index);
        widget.onAddButtonTapped(3);
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
                      snapshot.data![index].username!,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      snapshot.data![index].email!,
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
      appBar: PageHeader.getAppBar(
          'Usuários', context, widget.onAddButtonTapped, 2),
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(Icons.post_add),
        ),
        onPressed: () => widget.onAddButtonTapped(0),
      ),
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
                  child: StreamBuilder<List<UserEntity>?>(
                      stream: presenter.usersList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: height),
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    makeUserCard(snapshot, index, presenter),
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
