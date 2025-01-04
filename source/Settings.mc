import Toybox.Application.Storage;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class SettingsView extends WatchUi.View {
  public function initialize() {
    View.initialize();
  }

  function onLayout(dc) as Void {
    var menu = new $.SettingsMenu();
    var boolean = Storage.getValue(1) ? true : false;
    menu.addItem(
      new WatchUi.ToggleMenuItem("Settings1", null, 1, boolean, null)
    );

    boolean = Storage.getValue(2) ? true : false;
    menu.addItem(
      new WatchUi.ToggleMenuItem("Settings2", null, 2, boolean, null)
    );

    boolean = Storage.getValue(3) ? true : false;
    menu.addItem(
      new WatchUi.ToggleMenuItem("Settings3", null, 3, boolean, null)
    );

    boolean = Storage.getValue(4) ? true : false;
    menu.addItem(
      new WatchUi.ToggleMenuItem("Settings4", null, 4, boolean, null)
    );

    WatchUi.pushView(
      menu,
      new $.SettingsMenuDelegate(),
      WatchUi.SLIDE_IMMEDIATE
    );
  }

  public function onUpdate(dc as Dc) as Void {}
}

class SettingsDelegate extends WatchUi.BehaviorDelegate {
  public function initialize() {
    BehaviorDelegate.initialize();
  }

  public function onMenu() as Boolean {
    return true;
  }
}
