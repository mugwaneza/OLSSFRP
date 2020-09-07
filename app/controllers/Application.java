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

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;

import static org.joda.time.format.ISODateTimeFormat.time;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render());
    }

    public static  Result agentSignup(){

//        return ok(signup_agent.render("welcome"));
        return null;
    }

      // Display agent signin form
    public static  Result agentSingin(){

        // Find user session
        boolean Session =  session().get("agentlog") !=null;

        if(Session){

//            String ExistingSession = session().get("agentlog");
//           AgentApplication applicant  =AgentApplication.application(ExistingSession);
//            boolean applied = applicant !=null;
//
//            if (applied){    // When student has loggedin and applied
//
//                return redirect("/applied/agent");
//            }
//            else{     // When student has loggedin and has not applied
//
//                return redirect("/application/agent");
//            }
        }
//        else{
//            return ok(signin_agent.render("welcome"));
//        }

        return  null;
    }


    public static Result agentSignupCreate(){

        DynamicForm signupForm = new DynamicForm().bindFromRequest();
//        AgentsAccounts user = new AgentsAccounts();
//        user.fullname =signupForm.field("names").value();
//        user.gender =signupForm.field("gender").value();
//        user.email =signupForm.field("email").value();
//        String Texpassword =signupForm.field("password").value();
////        user.password = BCrypt.hashpw(Texpassword, BCrypt.gensalt());
//          user.password = Texpassword;
//
//        String email = signupForm.get("email");
//        if ((user.isEmailExist(email) ) == null){
//            user.save();
//            flash("success", "successfully registered, go back to login");
//            session().clear();
//            return ok(views.html.signup_agent.render("success"));
//        }
//        else {
//
//            flash("error", "User with email : " +email+ " aleready exist");
//        return badRequest(signup_agent.render("error"));
//    }

        return  null;
    }

    // login for agent  function
    public static Result agentSigninCreate(){

//
//        // get form's email and password
//        DynamicForm myloginForm = new DynamicForm().bindFromRequest();
//        String email = myloginForm.get("email");
//        String Inpassword = myloginForm.get("password");
//
//        //Access agentaccount model
//        AgentsAccounts agentaccount  = new AgentsAccounts();
//
//        // fetch data from agent table using input email method
//         AgentsAccounts user = agentaccount.isEmailExist(email);
//
//        // Decrypt hashed password and compare it to input password
//        // check if email exist and if password match then return fetched id then continue
////           if ((agentaccount.isEmailExist(email))!=null  && BCrypt.checkpw(Inpassword, user.password)){
//           if ((agentaccount.isEmailExist(email))!=null  && ( user.password.equals(Inpassword)) ){
//
//
//            long myid = user.id;
//               String id =  Long.toString(myid);
//
//               // Clear existing session
//              session().clear();
//
//           //    create new session
//              session("agentlog", id);
//
////               return  redirect("/application/agent");
//               return redirect("/applied/agent");
//
//
//           }
//         else {
//
//             flash("error", "Invalid email or password ");
//     //             flash("error", "Invalid email or password <a href=\"" + routes.Application.agentSingin().url()+"\" class=\"btn btn-link\">Log in</a>");
//             return  ok(signin_agent.render("error"));
//           }

        return  null;
    }


    public static List<Inquiries> inquiry;
    //  Chat with interface for user
    public static Result ShowChat(){

        // get the list of all message sent by agent and his /her replies
       inquiry = Inquiries.FindAgentChat(session().get("agentlog"));
        return ok(agent_chat.render("", inquiry));
    }

       // When an agent sends achat
    public static Result SendChat(){
//        DynamicForm signupForm = new DynamicForm().bindFromRequest();
//        Inquiries user = new Inquiries();
//
//        String agentid = session().get("agentlog");
//        user.agents =AgentsAccounts.FindAgent.where().eq("id",agentid).findUnique() ;
//        user.message =signupForm.field("message").value();
//        user.save();
        flash("success"," Your message was sent, thanks " );
        return ok(agent_chat.render("success", inquiry));
    }


    /**
     * Logout and clean the session.
     */
    public static Result logout() {

        session().clear();
        flash("success", "You've been logged out");
        return Results.redirect("/");
    }


    public static Result GetSectors(Long id){
        // get the list of the sectors according to selected district and pass it to json
//      return ok(Json.toJson(Sector.ResultSectors(id)));
        return null;
     }

     public static Result GetCells(Long id){
        // get the list of the cells according to selected sector and pass it to json
//      return ok(Json.toJson(Cell.ResultCells(id)));
         return null;
     }

}
