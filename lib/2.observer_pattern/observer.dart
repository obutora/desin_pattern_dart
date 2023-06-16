// Observer に変更を通知するためのクラス
// 最低限、add, remove, notify の3つのメソッドを持つ
abstract class NewsSubject {
  void addObserver(NewsObserver observer);
  void removeObserver(NewsObserver observer);
  void notifyObservers();

  DateTime now();
}

// Observer に変更を通知するための実装
// Subject は オブザーバがObserverインターフェースを実装していること以外は何も知らない
class NewsData implements NewsSubject {
  List<NewsObserver> news = [];

  @override
  DateTime now() => DateTime.now();

  @override
  void addObserver(NewsObserver observer) {
    news.add(observer);
  }

  @override
  void removeObserver(NewsObserver observer) {
    news.remove(observer);
  }

  // すべての Observer に変更を通知する
  @override
  void notifyObservers() {
    for (NewsObserver e in news) {
      e.update();
    }
  }
}

// Subjectから変更を受け取るObserverの抽象クラス
// SubjectとObserver は1対n の関係になる
abstract class NewsObserver {
  // あとで NewsData の now() を使ってデータをpullするために、newsDataを保持しておく
  // 一方、push型の場合は、newsDataをObserverが知らなくても良いので保持する必要もない。
  late NewsSubject newsData;
  void update();
}

// NewsObserver に共通の処理を追加するためのmixin
// dartのmixinはクラスに処理を追加するための仕組み
// mixin は classと同じ意味を持つが、withを使って他のクラスに追加できる
// with を使うとオーバーライド不要のメンバやメソッドを追加できる
mixin NewsNum {
  int newsNum = 0;
}

// NewsObserver の実装1
// with NewsNum で NewsNum のメンバを追加している
class SportsNews with NewsNum implements NewsObserver {
  @override
  late NewsSubject newsData;

  SportsNews(this.newsData);

  // Observerパターンでは、SubjectからObserverへの通知はpush型とpull型の2種類がある
  // push型はSubjectからObserverへの通知を引数に渡す
  // pull型はObserverがSubjectから値を取得する
  // この例ではpull型を採用
  @override
  void update() {
    newsNum++;
    print('${newsData.now().toString()} : スポーツニュースを更新しました');
  }
}

// NewsObserver の実装2
// newsRatio を追加し, update() で他のObserverと異なったnewsNumの更新ロジックをもつ
// このように、update() の中身を変えることで、Observerごとに異なる処理を実装できる
class WeatherNews with NewsNum implements NewsObserver {
  @override
  late NewsSubject newsData;
  WeatherNews(this.newsData);

  final int newsRatio = 5;

  @override
  void update() {
    newsNum = newsNum + newsRatio;
    print('${newsData.now().toString()} : 天気ニュースを更新しました');
  }
}

// NewsObserver の実装3
// 実装はほぼ SportsNews と同じだが、テストでSubjectから削除されていることを確認するために用意した。
class VarietyNews with NewsNum implements NewsObserver {
  @override
  late NewsSubject newsData;
  VarietyNews(this.newsData);

  @override
  void update() {
    newsNum++;
    print('${newsData.now().toString()} : バラエティニュースを更新しました');
  }
}
