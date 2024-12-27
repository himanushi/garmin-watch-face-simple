import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class View extends WatchUi.WatchFace {
  var isAwake = true;
  var display = new Display();

  function initialize() {
    WatchFace.initialize();
  }

  function onLayout(dc as Dc) as Void {}

  function onShow() as Void {}

  function onUpdate(dc as Dc) as Void {
    dc.clear();

    display.updateTime(dc, isAwake);
  }

  function onHide() as Void {}

  function onEnterSleep() as Void {
    isAwake = false;
    WatchUi.requestUpdate();
  }

  function onExitSleep() as Void {
    isAwake = true;
  }
}
