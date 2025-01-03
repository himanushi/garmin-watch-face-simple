import Toybox.Graphics;
import Toybox.Weather;
import Toybox.Lang;

module DisplayWeather {
  /*

condition = 1 (Lang.Number)
feelsLikeTemperature = 14.131069 (Lang.Float)
highTemperature = 17.0 (Lang.Float)
lowTemperature = 10.0 (Lang.Float)
observationLocationName = null
observationLocationPosition = null
observationTime = Lang.Object
  mDateTime = 1735696800 (Lang.Number)
precipitationChance = 9 (Lang.Number)
relativeHumidity = 55 (Lang.Number)
temperature = 14.0 (Lang.Float)
windBearing = 165 (Lang.Number)
windSpeed = 3.5 (Lang.Float)

*/

  function drawWeather(
    dc as Dc,
    x as Number,
    y as Number,
    width as Number,
    height as Number
  ) as Void {
    var currentWeather = Weather.getCurrentConditions();

    dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
    dc.drawText(
      x,
      y,
      Graphics.FONT_MEDIUM,
      "No Data",
      Graphics.TEXT_JUSTIFY_CENTER
    );
  }
}
