import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application.Properties;

const DISPLAY_METHODS = {
  "date" => [DisplayDate, :drawDate],
  "battery" => [DisplayBattery, :drawBatteryIcon],
  "weather" => [DisplayWeather, :drawWeather]
};

module Display {
  function updateData1(dc as Dc) as Void {
    Properties.setValue("data_field1", "weather");

    var prop = Properties.getValue("data_field1");
    var method = new Lang.Method(
      DISPLAY_METHODS[prop][0],
      DISPLAY_METHODS[prop][1]
    );
    method.invoke(dc, 240.0, 140.0, 50.0, 20.0);
  }
}

// バッテリー
// 日付
// 曜日と日付
// 日付と月
// 天気

// body battery
// HRV status
// UTC time
// VO2 max
// アラーム
// イベントカウントダウン
// カレンダー
// カロリー
// サーフェスインターバル
// ステップ数
// ストレスレベル
// タイマー
// トレーニングレディーレス
// ヒルスコア
// リカバリータイム
// ロゴ
// 上昇階数
// 別のタイムゾーン
// 呼吸数
// 大気圧
// 心拍
// 持久力スコア
// 日の入り時刻
// 日の出/日の入り
// 日の出時刻
// 気圧の傾向
// 短期的負荷
// 血中酸素
// 通知
// 週間サイクリング距離
// 週間ランニング距離
// 週間運動量
// 飛行禁止
// 高度
// 高温/低温
// なし
