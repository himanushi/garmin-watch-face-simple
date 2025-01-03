import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Math;

const centerX = 20.0;
const centerY = 25.0;

module DisplayAnalogHands {
  function updateMinuteTime(dc as Dc) as Void {
    var clockTime = System.getClockTime();

    var hand =
      WatchUi.loadResource(Rez.Drawables.HourHandle) as WatchUi.BitmapResource;
    var xform = new AffineTransform();
    xform.scale(widthRate, heightRate);
    xform.translate(207.0 + centerX, 202.0 + centerY);
    var hour = clockTime.hour % 12;
    var minute = clockTime.min;
    hour += minute / 60.0;
    xform.rotate((hour * Math.PI) / 6.0 + Math.PI);
    xform.translate(-centerX, -centerY);
    dc.drawBitmap2(0, 0, hand, { :transform => xform });

    hand =
      WatchUi.loadResource(Rez.Drawables.MinuteHandle) as
      WatchUi.BitmapResource;
    xform = new AffineTransform();
    xform.scale(widthRate, heightRate);
    xform.translate(207.0 + centerX, 202.0 + centerY);
    minute = clockTime.min;
    xform.rotate((minute * Math.PI) / 30.0 + Math.PI);
    xform.translate(-centerX, -centerY);
    dc.drawBitmap2(0, 0, hand, { :transform => xform });
  }

  function updateSecondTime(dc as Dc) as Void {
    var clockTime = System.getClockTime();

    var hand =
      WatchUi.loadResource(Rez.Drawables.SecondHandle) as
      WatchUi.BitmapResource;
    var xform2 = new AffineTransform();
    xform2.scale(widthRate, heightRate);
    xform2.translate(207.0 + centerX, 202.0 + centerY);
    var second = clockTime.sec;
    xform2.rotate((second * Math.PI) / 30.0 + Math.PI);
    xform2.translate(-centerX, -centerY);
    dc.drawBitmap2(0, 0, hand, { :transform => xform2 });

    var metal =
      WatchUi.loadResource(Rez.Drawables.Metal) as WatchUi.BitmapResource;
    var xform = new AffineTransform();
    xform.scale(widthRate, heightRate);
    dc.drawBitmap2(0, 0, metal, { :transform => xform });
  }
}
