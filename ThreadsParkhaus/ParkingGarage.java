package parkhausThread;


public class ParkingGarage{
    // declaring variables
    static int space;
    static int taken;

    // constructor of ParkingGarage
    public ParkingGarage(int spaces){
        this.space = space;
        this.taken = 0;
    }

    // methode returns empty spaces in the parking garage
    public static int getFreeSpaces(){
        return (space-taken);
    }

    // methode for entering with a car
    public void enter(){
        taken++;
        System.out.println("eingefahren | Freie Plätze: " +(getFreeSpaces()));


    }
    // methode for leaving with a car
    public void leave(){
        taken--;
        System.out.println("ausgefahren | Freie Plätze: " +(getFreeSpaces()));
    }
}