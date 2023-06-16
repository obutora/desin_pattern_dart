import 'package:design_pattern_dart/2.observer_pattern/observer.dart';
import 'package:test/test.dart';

void main() {
  test('Observer Pattern', () {
    // subjectの生成
    final newsData = NewsData();

    // observerの生成
    final sportsNews = SportsNews(newsData);
    final weatherNews = WeatherNews(newsData);
    final varietyNews = VarietyNews(newsData);

    // observerの登録
    newsData.addObserver(sportsNews);
    newsData.addObserver(weatherNews);
    newsData.addObserver(varietyNews);

    // observerに変更を通知
    newsData.notifyObservers();

    // observerの状態を確認
    // weatherNews は newsRatio が 5 なので、5ずつ増加
    expect(sportsNews.newsNum, 1);
    expect(weatherNews.newsNum, 5);
    expect(varietyNews.newsNum, 1);

    // observerの登録解除
    newsData.removeObserver(sportsNews);

    // observerに再度変更を通知
    // sportsNews は登録解除されているので、newsNum は増加しない
    // weatherNews は newsRatio が 5 なので、5ずつ増加
    // varietyNews は登録されているので、newsNum が1増加する
    newsData.notifyObservers();
    expect(sportsNews.newsNum, 1);
    expect(weatherNews.newsNum, 10);
    expect(varietyNews.newsNum, 2);
  });
}
