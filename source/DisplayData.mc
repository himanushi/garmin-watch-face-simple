import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Math;

const SCREEN_MULTIPLIER = System.getDeviceSettings().screenWidth < 360 ? 1 : 2;
const BATTERY_HEAD_HEIGHT = 4 * SCREEN_MULTIPLIER;
const BATTERY_MARGIN = SCREEN_MULTIPLIER;

class DisplayData {
  function initialize() {}

  function updateData1(dc as Dc, isAwake as Boolean) as Void {
    drawBatteryMeter(dc, 207.0, 202.0, 50.0, 20.0);
  }

  // ref: https://github.com/warmsound/crystal-face/blob/master/source/CrystalView.mc#L35
  function drawBatteryMeter(dc, x, y, width, height) {
    dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
    dc.setPenWidth(2);
    dc.drawRoundedRectangle(
      x - width / 2 + 1,
      y - height / 2 + 1,
      width - 1,
      height - 1,
      2 * SCREEN_MULTIPLIER
    );

    dc.fillRectangle(
      x + width / 2 + BATTERY_MARGIN,
      y - BATTERY_HEAD_HEIGHT / 2,
      2,
      BATTERY_HEAD_HEIGHT
    );

    var batteryLevel = Math.floor(System.getSystemStats().battery);

    var fillColour;
    if (batteryLevel <= 10) {
      fillColour = Graphics.COLOR_RED;
    } else if (batteryLevel <= 20) {
      fillColour = Graphics.COLOR_YELLOW;
    } else {
      fillColour = Graphics.COLOR_GREEN;
    }

    dc.setColor(fillColour, Graphics.COLOR_TRANSPARENT);

    var lineWidthPlusMargin = 2 + BATTERY_MARGIN;
    var fillWidth = width - 2 * lineWidthPlusMargin;
    dc.fillRectangle(
      x - width / 2 + lineWidthPlusMargin,
      y - height / 2 + lineWidthPlusMargin,
      Math.ceil(fillWidth * (batteryLevel / 100)),
      height - 2 * lineWidthPlusMargin + (SCREEN_MULTIPLIER - 1)
    );
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
}
