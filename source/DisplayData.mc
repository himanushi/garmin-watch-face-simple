import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Math;
import Toybox.Time.Gregorian;
import Toybox.Time;

const SCREEN_MULTIPLIER = System.getDeviceSettings().screenWidth < 360 ? 1 : 2;
const BATTERY_HEAD_HEIGHT = 4 * SCREEN_MULTIPLIER;
const BATTERY_MARGIN = SCREEN_MULTIPLIER;

module DisplayData {
  function updateData1(dc as Dc, isAwake as Boolean) as Void {
    // drawBatteryIcon(dc, 230.0, 120.0, 50.0, 20.0);
    // drawBatteryText(dc, 240.0, 140.0, 50.0, 20.0);
    drawDate(dc, 240.0, 140.0, 50.0, 20.0);
  }

  function drawDate(dc, x, y, width, height) {
    var info = Gregorian.info(Time.now(), Time.FORMAT_LONG);
    var dateStr = Lang.format("$1$ $2$ $3$", [
      info.day_of_week,
      info.month,
      info.day
    ]);
    dc.setColor(0x000000, Graphics.COLOR_TRANSPARENT);
    dc.drawText(
      x,
      y,
      Graphics.FONT_SMALL,
      dateStr,
      Graphics.TEXT_JUSTIFY_CENTER
    );
  }

  function drawBatteryText(dc, x, y, width, height) {
    dc.setColor(0x000000, Graphics.COLOR_TRANSPARENT);
    dc.drawText(
      x,
      y,
      Graphics.FONT_SMALL,
      (System.getSystemStats().battery + 0.5).toNumber().toString() + "%",
      Graphics.TEXT_JUSTIFY_CENTER
    );
  }

  // ref: https://github.com/warmsound/crystal-face/blob/master/source/CrystalView.mc#L35
  function drawBatteryIcon(dc, x, y, width, height) {
    dc.setColor(0x000000, Graphics.COLOR_TRANSPARENT);
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
