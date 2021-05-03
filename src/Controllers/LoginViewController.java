/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAO.DBAppointment;
import Utilities.UserLogger;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import DAO.DBUsers;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.paint.Color;
import java.util.Locale;
import java.util.MissingResourceException;

/**
 * LoginView FXML Controller class
 *
 * @author Manuel Fuentes
 */
public class LoginViewController implements Initializable {

    
    @FXML
    private Label loginUserNameLabel;
    
    @FXML
    private Label loginPasswordLabel;
    
    @FXML
    private Label loginTitleLabel;

    @FXML
    private TextField userNameTextField;

    @FXML
    private PasswordField passwordTextField;

    @FXML
    private Label statusMessageLabel;
    
    @FXML
    private Label zoneIdLabel;

    @FXML
    private Button loginButton;

    @FXML
    private Button closeButton;
    
    @FXML
    private ImageView lockIconImageView;

    @FXML
    private ImageView appLogoImageView;

    Stage stage;
    Parent scene;
    ZoneId zoneId = ZoneId.systemDefault();
    Locale locale = Locale.getDefault();
    ResourceBundle rb;
    
    /**
     * Initializes LoginViewController
     * @param url URL
     * @param rb ResourceBundle
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        
        try{
           
        rb = ResourceBundle.getBundle("Properties/login", locale);
        //Set internationalization variables
        loginTitleLabel.setText(rb.getString("title"));
        loginUserNameLabel.setText(rb.getString("username"));
        userNameTextField.setPromptText(rb.getString("usernamePrompt"));
        loginPasswordLabel.setText(rb.getString("password"));
        passwordTextField.setPromptText(rb.getString("passwordPrompt"));
        loginButton.setText(rb.getString("login"));
        closeButton.setText(rb.getString("close"));
        
        //Load app logo
        File appLogoFile = new File("Images/AppLogo.png");
        Image appLogoImage = new Image(appLogoFile.toURI().toString());
        appLogoImageView.setImage(appLogoImage);
        
        //Load lock icon
        File lockIconFile = new File("Images/LockIcon.png");
        Image lockIconImage = new Image(lockIconFile.toURI().toString());
        lockIconImageView.setImage(lockIconImage);
        
        
        String zoneIdInfo = zoneId.toString();
        String localeInfo = locale.toString();
        
        zoneIdLabel.setText(rb.getString("zoneInfo") + " " + zoneIdInfo);
        System.out.println(localeInfo);
        
        
        }
        
        catch(MissingResourceException e){
            e.printStackTrace(System.out);
        }
        
        
    }  
    
    @FXML
    void handleCloseButton(ActionEvent event) {
        stage = (Stage) closeButton.getScene().getWindow();
        stage.close();

    }

    /**
     * Handle loginButton
     * @param event
     * @throws SQLException
     * @throws IOException 
     */
    @FXML
    void handleLoginButton(ActionEvent event) throws SQLException, IOException {
        rb = ResourceBundle.getBundle("Properties/login", locale);
        //If input fields are not blank, perform user validation
        if(userNameTextField.getText().isBlank() == false && passwordTextField.getText().isBlank() == false){
            validateLogin(event);
        }

        //If input fields are blank, prompt user
        else{
            statusMessageLabel.setText(rb.getString("empty"));
        }

    }

    /**
     * Checks if DBUsers.validatedLogin() returns true
     * @param event ActionEvent
     * @throws SQLException
     * @throws IOException
     */
    public void validateLogin(ActionEvent event) throws SQLException, IOException{
        
        //UserLog Variable
        String username = userNameTextField.getText();
        
        
            if(DBUsers.validatedLogin(userNameTextField.getText(), passwordTextField.getText()) == true){

              //Log valid user name
              UserLogger.trackingLog(username, true);

              stage = (Stage)((Button)event.getSource()).getScene().getWindow();
              scene = FXMLLoader.load(getClass().getResource("/Views/MainView.fxml"));
              stage.setScene(new Scene(scene));
              stage.show();
              
              
              //Timestamp tsIn = Timestamp.valueOf(LocalDateTime.now());
              LocalDateTime ldt = LocalDateTime.now();
              ZonedDateTime zdt = ldt.atZone(ZoneId.systemDefault()).withZoneSameInstant(ZoneId.of("UTC"));
              Timestamp tsNow = Timestamp.valueOf(zdt.toLocalDateTime());
              Timestamp tsNowPlus = Timestamp.valueOf(zdt.toLocalDateTime().plusMinutes(15));
              
              DBAppointment.appointmentIn15MinutesWarning(userNameTextField.getText(), tsNow, tsNowPlus);
              
              //DBAppointment.appointmentIn15MinutesWarning(userNameTextField.getText(), Timestamp.valueOf(zdt.toLocalDateTime()), Timestamp.valueOf(zdt.toLocalDateTime().plusMinutes(15)));

              //DBAppointment.appointmentIn15MinutesWarning(userNameTextField.getText(), Timestamp.valueOf(LocalDateTime.now()), Timestamp.valueOf(LocalDateTime.now().plusMinutes(15)));
              
                }
            
            else {
               statusMessageLabel.setText(rb.getString("incorrect"));
               statusMessageLabel.setTextFill(Color.web("#ff0000"));
               //Log invalid user name
               UserLogger.trackingLog(username, false);
                }

    }
    
}
