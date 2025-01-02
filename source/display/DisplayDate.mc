import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Math;
import Toybox.Time.Gregorian;
import Toybox.Time;

module DisplayDate {
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
}
