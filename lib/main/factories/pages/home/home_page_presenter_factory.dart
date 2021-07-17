import '../../factories.dart';
import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';

HomePresenter makeGetxHomePresenter() {
  return GetxHomePresenter(
    fetchBlogPosts: makeFetchBlogPosts(),
  );
}
