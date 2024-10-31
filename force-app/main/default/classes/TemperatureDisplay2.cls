public class TemperatureDisplay2 implements Observer {
    /// this is the observer class, it is updated by the Subject class
    private WeatherStation weatherStation;

    public TemperatureDisplay2(WeatherStation weatherStation) {
        this.weatherStation = weatherStation;
        weatherStation.addObserver(this); ///// calling this from the Subject Class 
        
    }

    ////This is called when the Subject class STATE changes
    public void updateTemp() {
        System.debug('Temperature updated 2 : ' + weatherStation.getTemperature());
        System.debug('getHumidity updated 2 : ' + weatherStation.getHumidity());
        System.debug('getPressure updated 2 : ' + weatherStation.getPressure());
    }
}