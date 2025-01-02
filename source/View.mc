import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class View extends WatchUi.WatchFace {
  var isAwake = true;

  function initialize() {
    WatchFace.initialize();
  }

  function onLayout(dc as Dc) as Void {}

  function onHide() as Void {
    isAwake = false;
    WatchUi.requestUpdate();
  }

  function onShow() as Void {
    isAwake = true;
  }

  function onUpdate(dc as Dc) as Void {
    dc.clear();

    var backend =
      WatchUi.loadResource(
        isAwake ? Rez.Drawables.Background : Rez.Drawables.BackgroundDark
      ) as WatchUi.BitmapResource;
    var xform = new AffineTransform();
    xform.scale(widthRate, heightRate);
    dc.drawBitmap2(0, 0, backend, { :transform => xform });

    Display.updateData1(dc);
    DisplayAnalogHands.updateMinuteTime(dc);
    if (isAwake) {
      DisplayAnalogHands.updateSecondTime(dc);
    }
  }

  function onEnterSleep() as Void {
    isAwake = false;
    WatchUi.requestUpdate();
  }

  function onExitSleep() as Void {
    isAwake = true;
  }
}
