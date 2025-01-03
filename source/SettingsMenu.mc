import Toybox.Application.Storage;
import Toybox.Lang;
import Toybox.WatchUi;

class SettingsMenu extends WatchUi.Menu2 {
  public function initialize() {
    Menu2.initialize({ :title => "Settings" });
  }
}

class SettingsMenuDelegate extends WatchUi.Menu2InputDelegate {
  public function initialize() {
    Menu2InputDelegate.initialize();
  }

  public function onSelect(menuItem as MenuItem) as Void {
    if (menuItem instanceof ToggleMenuItem) {
      Storage.setValue(menuItem.getId() as Number, menuItem.isEnabled());
    }
  }
}
