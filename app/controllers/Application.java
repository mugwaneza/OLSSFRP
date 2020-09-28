package controllers;

import akka.util.ByteString;
import com.fasterxml.jackson.databind.JsonNode;
import models.*;
import org.mindrot.jbcrypt.BCrypt;
import play.*;
import play.api.libs.Files;
import play.api.mvc.Session;
import play.data.DynamicForm;
import play.libs.Json;
import play.mvc.*;

import scala.concurrent.stm.Source;
import scala.xml.Null;
import scalax.file.Path;
import scalax.io.support.FileUtils;
import views.html.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.util.List;

import static org.joda.time.format.ISODateTimeFormat.time;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render());
    }

  public static Result PostReview(Long id){


      InetAddress IP= null;
      try {
          IP = InetAddress.getLocalHost();
      } catch (UnknownHostException e) {
          e.printStackTrace();
      }
//      System.out.println("IP of my system is := "+IP.getHostAddress());

        Laws_review review = new Laws_review();
         review.law =  Laws.FindLaws.byId(id);
         review.country =  IP.getHostAddress();
         review.save();

         return ok();
     }

    public static List<Inquiries> inquiry;

       // When an agent sends achat
    public static Result SendChat(){
        DynamicForm inquiryForm = new DynamicForm().bindFromRequest();
        String userIdentity = inquiryForm.field("identity").value();

        Inquiries user = new Inquiries();

        user.inquiry = inquiryForm.field("inquiry").value();
        user.citizen_name =inquiryForm.field("names").value();
        user.citizen_identification =userIdentity;
        user.save();
        flash("chatmessage", userIdentity);
        return ok(citizen_inquiry_chatpage.render("chatmessage"));
    }


    /**
     * Logout and clean the session.
     */
    public static Result logout() {

        session().clear();
        flash("success", "You've been logged out");
        return Results.redirect("/");
    }



}
