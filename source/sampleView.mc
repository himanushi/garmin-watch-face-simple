import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class sampleView extends WatchUi.WatchFace {
  var _isAwake = true;

  function initialize() {
    WatchFace.initialize();
  }

  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.WatchFace(dc));
  }

  function onShow() as Void {}

  function onUpdate(dc as Dc) as Void {
    dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    dc.clear();

    var clockTime = System.getClockTime();

    var backend =
      WatchUi.loadResource(
        _isAwake ? Rez.Drawables.Background : Rez.Drawables.BackgroundDark
      ) as WatchUi.BitmapResource;
    dc.drawBitmap2(0, 0, backend, {});

    var hand =
      WatchUi.loadResource(Rez.Drawables.HourHandle) as WatchUi.BitmapResource;
    var xform = new AffineTransform();
    xform.translate(207.0 + 20, 202.0 + 23);
    var hour = clockTime.hour % 12;
    var minute = clockTime.min;
    hour += minute / 60.0;
    xform.rotate((hour * Math.PI) / 6.0 + Math.PI);
    xform.translate(-20.0, -23.0);
    dc.drawBitmap2(0, 0, hand, { :transform => xform });

    hand =
      WatchUi.loadResource(Rez.Drawables.MinuteHandle) as
      WatchUi.BitmapResource;
    xform = new AffineTransform();
    xform.translate(207.0 + 20, 202.0 + 23);
    minute = clockTime.min;
    xform.rotate((minute * Math.PI) / 30.0 + Math.PI);
    xform.translate(-20.0, -23.0);
    dc.drawBitmap2(0, 0, hand, { :transform => xform });

    if (_isAwake) {
      hand =
        WatchUi.loadResource(Rez.Drawables.SecondHandle) as
        WatchUi.BitmapResource;
      var xform2 = new AffineTransform();
      xform2.translate(207.0 + 20, 202.0 + 23);
      var second = clockTime.sec;
      xform2.rotate((second * Math.PI) / 30.0 + Math.PI);
      xform2.translate(-20.0, -23.0);
      dc.drawBitmap2(0, 0, hand, { :transform => xform2 });

      var metal =
        WatchUi.loadResource(Rez.Drawables.Metal) as WatchUi.BitmapResource;
      xform = new AffineTransform();
      xform.translate(0.0, 0.0);
      dc.drawBitmap2(0, 0, metal, { :transform => xform });
    }
  }

  function onHide() as Void {}

  function onEnterSleep() as Void {
    _isAwake = false;
    WatchUi.requestUpdate();
  }

  function onExitSleep() as Void {
    _isAwake = true;
  }
}
