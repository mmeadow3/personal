public class TemperatureDisplay implements Observer {
    /// this is the observer class, it is updated by the Subject class
    private WeatherStation weatherStation;

    public TemperatureDisplay(WeatherStation weatherStation) {
        this.weatherStation = weatherStation;
        System.debug('adding from the Observer Class' + this);  
        weatherStation.addObserver(this); ///// calling this from the Subject Class     
    }

    ////This is called when the Subject class STATE changes
    public void updateTemp() {
        System.debug('Temperature updated: ' + weatherStation.getTemperature());
        System.debug('getHumidity updated: ' + weatherStation.getHumidity());
        System.debug('getPressure updated: ' + weatherStation.getPressure());
    }
}