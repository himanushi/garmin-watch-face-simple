import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class App extends Application.AppBase {
  function initialize() {
    AppBase.initialize();
  }

  function getInitialView() as [Views] or [Views, InputDelegates] {
    return [new $.View()];
  }
}

function getApp() as App {
  return Application.getApp() as App;
}
