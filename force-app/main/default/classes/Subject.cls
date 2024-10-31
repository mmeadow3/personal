public interface Subject {
    //// This is the class that maintains the Observers 
    void addObserver(Observer observer);
    void removeObserver(Observer observer);
    void notifyObservers();
}
