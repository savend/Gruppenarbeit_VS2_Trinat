package parkhausThread;


public class Parking {
    public static void main(String[] args) {

        //creating new objects garages with 10 spaces
        ParkingGarage garage = new ParkingGarage(10);

        //creating new object car with 10 cars
        Car [] carNr = new Car[10];
            for (int i = 0; i<carNr.length; i++){
                carNr[i] = new Car("Auto" + i,garage);
                carNr[i].start();
            }
    }
}