package parkhausThread;

public class Car extends Thread{
    String autoName;
    ParkingGarage garage;

    // constructor of the object car
    public Car(String autoName, ParkingGarage garage){
        this.autoName = autoName;
        this.garage = garage;
    }

    @Override
    public void run(){
        // parking garage algorithm is running until a user stop the programm
        while(true){
            try{
                // get the amount of free spaces in parking garage
                int freeSpaces = ParkingGarage.getFreeSpaces();

                // calling entering method for cars in Parking Garage
                // if the parking garage is not full, the cars can enter
                if (freeSpaces > 0) {
                    Thread.sleep((long) (Math.random() * 10000));
                    System.out.print(autoName + ": ");
                    garage.enter();
                }
                // if the parking garage is full, the cars can't enter
                else {
                    System.out.println("Keine freien Parkplätze");
                }

                // calling leaving method for cars in Parking Garage
                Thread.sleep((long)(Math.random() * 10000));
                System.out.print(autoName + ": ");
                garage.leave();
            } catch (InterruptedException e) {
                System.err.println(e);
            }
        }
    }
}