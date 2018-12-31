import 'package:rxdart/rxdart.dart';
import 'package:habit/c_respo/respo.dart';

class Bloc {
  final _repository = Repository();

  final _loading = BehaviorSubject<bool>(seedValue: false);
  final _text = PublishSubject<String>();

  Observable<String> get text => _text.stream;

/*
login(String email, String password) async {
User itemModel = await _repository.login(email, password);
_loginFetcher.sink.add(itemModel);
}

email(String email) async {
EmailInfo itemModel = await _repository.email(email);
_emailInfoFetcher.sink.add(itemModel);
}*/

  load(bool load) {
    _loading.sink.add(load);
  }

  addText(String text) {
    _text.sink.add(text);
  }

  dispose() {
    _loading.close();
    _text.close();
  }
}
