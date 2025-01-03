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

module DisplayBattery {
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
}
