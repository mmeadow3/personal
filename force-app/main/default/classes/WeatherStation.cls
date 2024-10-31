public class WeatherStation implements Subject {
    /////a Subject class maintains a list of its Observers and notifies them of any state changes
    private List<Observer> observers;
    private Decimal temperature;
    private Decimal humidity;
    private Decimal pressure;

    public WeatherStation() {
        observers = new List<Observer>();
    }

    public void addObserver(Observer observer) {
        System.debug('added : ' + observer);  //// Adds a Temperature Display Class
        observers.add(observer);
        //// This list grows with every Observer Class (Temperature Display) that is added
    }

    public void removeObserver(Observer observer) {
        /// no easy way to remove the class from the Class list
        for (Integer i = observers.size() - 1; i >= 0; i--) {
            if (observers[i] == observer) {
                observers.remove(i);
            }
        }
    }


    //// The Observers are objects that depend on the state of the Subject, 
    ///and they define a method to update their state when they receive a notification from the Subject
    public void notifyObservers() {
        System.debug('notify from WeatherStation Class!!!!! ');
        for (Observer observer : observers) {
            System.debug('Now calling the Observer Update Temp method on ALL Observers');
            observer.updateTemp();
        }
    }

    ////
    ////
    ////it updates its internal state and then calls the notifyObservers method. 
    //This method iterates through the list of Observers and calls their update method, allowing them to update their state accordingly.
    public void setMeasurements(Decimal temperature, Decimal humidity, Decimal pressure) {
        this.temperature = temperature;
        this.humidity = humidity;
        this.pressure = pressure;
        notifyObservers();  //////////////////// <= ------------------
    }

    public Decimal getTemperature() {
        return temperature;
    }

    public Decimal getHumidity() {
        return humidity;
    }

    public Decimal getPressure() {
        return pressure;
    }
    ///// here is how this is called:
//  WeatherStation ws = new WeatherStation();     ///// Create the Subject object
// TemperatureDisplay td = new TemperatureDisplay(ws);   Then create instances of the observers
// TemperatureDisplay2 td2 = new TemperatureDisplay2(ws);
// ws.setMeasurements(150, 80, 70);   //// every time the subject is update with this, it updates the Observers
// ws.setMeasurements(69, 69, 69);

}
