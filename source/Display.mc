import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application.Properties;

const DISPLAY_METHODS = {
  "date" => [DisplayData, :updateData1]
};

module Display {
  function updateData1(dc as Dc) as Void {
    Properties.setValue("data_field1", "date");

    var prop = Properties.getValue("data_field1");
    var method = new Lang.Method(
      DISPLAY_METHODS[prop][0],
      DISPLAY_METHODS[prop][1]
    );
    method.invoke(dc);
  }
}
