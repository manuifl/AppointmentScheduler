/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package AppointmentScheduler;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import DAO.DBConnection;




/**
 * Main class of application
 * @author Manuel Fuentes
 */
public class Main extends Application{

    

    /**
     * Application start
     * @param primaryStage Stage
     * @throws Exception
     */

    @Override
    public void start(Stage primaryStage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("/Views/LoginView.fxml"));
        primaryStage.setScene(new Scene(root));
        primaryStage.show();   
    }
    
    /**
     * Main function
     * @param args
     */
    public static void main(String[] args) {
         
        //Testing Internationalization
        //Locale.setDefault(Locale.FRANCE);
        //Testing Timezones
        //TimeZone tz = TimeZone.getTimeZone("Etc/GMT+5");
        //TimeZone.setDefault(tz);
        
        DBConnection.startConnection();
        launch(args);
        DBConnection.closeConnection();
        
    }
    
}
