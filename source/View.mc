import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class View extends WatchUi.WatchFace {
  var _isAwake = true;

  function initialize() {
    WatchFace.initialize();
    var deviceInfo = System.getDeviceSettings();
    System.print(deviceInfo);
  }

  function onLayout(dc as Dc) as Void {
    setLayout(Rez.Layouts.WatchFace(dc));
  }

  function onShow() as Void {}

  function onUpdate(dc as Dc) as Void {
    dc.clear();

    var widthRate = dc.getWidth() / 454.0;
    var heightRate = dc.getHeight() / 454.0;
    var x = 20.0;
    var y = 23.0;

    var clockTime = System.getClockTime();

    var backend =
      WatchUi.loadResource(
        _isAwake ? Rez.Drawables.Background : Rez.Drawables.BackgroundDark
      ) as WatchUi.BitmapResource;
    var xform = new AffineTransform();
    xform.scale(widthRate, heightRate);
    dc.drawBitmap2(0, 0, backend, { :transform => xform });

    var hand =
      WatchUi.loadResource(Rez.Drawables.HourHandle) as WatchUi.BitmapResource;
    xform = new AffineTransform();
    xform.scale(widthRate, heightRate);
    xform.translate(207.0 + x, 202.0 + y);
    var hour = clockTime.hour % 12;
    var minute = clockTime.min;
    hour += minute / 60.0;
    xform.rotate((hour * Math.PI) / 6.0 + Math.PI);
    xform.translate(-x, -y);
    dc.drawBitmap2(0, 0, hand, { :transform => xform });

    hand =
      WatchUi.loadResource(Rez.Drawables.MinuteHandle) as
      WatchUi.BitmapResource;
    xform = new AffineTransform();
    xform.scale(widthRate, heightRate);
    xform.translate(207.0 + x, 202.0 + y);
    minute = clockTime.min;
    xform.rotate((minute * Math.PI) / 30.0 + Math.PI);
    xform.translate(-x, -y);
    dc.drawBitmap2(0, 0, hand, { :transform => xform });

    if (_isAwake) {
      hand =
        WatchUi.loadResource(Rez.Drawables.SecondHandle) as
        WatchUi.BitmapResource;
      var xform2 = new AffineTransform();
      xform2.scale(widthRate, heightRate);
      xform2.translate(207.0 + x, 202.0 + y);
      var second = clockTime.sec;
      xform2.rotate((second * Math.PI) / 30.0 + Math.PI);
      xform2.translate(-x, -y);
      dc.drawBitmap2(0, 0, hand, { :transform => xform2 });

      var metal =
        WatchUi.loadResource(Rez.Drawables.Metal) as WatchUi.BitmapResource;
      xform = new AffineTransform();
      xform.scale(widthRate, heightRate);
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
