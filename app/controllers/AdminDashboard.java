package controllers;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.SqlUpdate;
import models.*;
import oauth.signpost.http.HttpResponse;
import org.mindrot.jbcrypt.BCrypt;
import play.data.DynamicForm;
import play.data.Form;
import play.mvc.Controller;
import play.mvc.Http;
import play.mvc.Result;
import scala.xml.Null;
import views.html.*;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


import static play.data.Form.form;

public class AdminDashboard extends Controller {
    // Bind form data
    public static  DynamicForm  myform;

    public static Result DashboardIndex() {
        return ok(views.html.admin.render());
    }

    public static Result AdminViewLawComment() {

        return ok(views.html.admin_citizens_comments.render());
    }
    public static Result AdminViewLawReview() {
        return ok(views.html.admin_review_law.render());
    }


     public static Result DashboardLawform() {
        return ok(views.html.admin_register_law.render("welcome"));

    }



      public static Result DashboardRegisterLawsCat() {

        return ok(views.html.admin_register_law_cat.render("welcome"));

    }

    public static Result DashboardAdminAccounts() {

        return ok(views.html.adminaccounts.render(""));

    }


    public static Result DashboardCreateLaw(){
        myform = form().bindFromRequest();

        String adminid = session().get("adminlog");
        Laws law = new Laws();

        String lawcat = myform.field("category_name").value();
        law.cat = Laws_category.findLawsCat.byId(Long.parseLong(lawcat));
        law.admin = AdminAccount.FindAdmin.byId(Long.parseLong(adminid));
        law.law_name = myform.field("law_name").value();
        law.law_number = myform.field("law_number").value();
        law.description = myform.field("description").value();

        String lawname = myform.get("law_name");
        if ((law.isLawExist(lawname)) ==null ){
             law.save();

            flash("success", lawname + " successfully saved " );
            return ok(views.html.admin_register_law.render("success"));
           }
        else{

        flash("error", lawname + " district already exist " );
            return badRequest(views.html.admin_register_law.render("error"));
        }
    }




    public static Result DashboardRegisterLawLawCatCreate(){
         String adminLog  = session().get("adminlog");

        myform  = form().bindFromRequest();
        String mycat = myform.get("category_name");
        String desc = myform.field("description").value();

        Laws_category lawcat = new Laws_category();
        lawcat.admin = AdminAccount.FindAdmin.byId(Long.parseLong(adminLog));;
        lawcat.category_name = mycat;
        lawcat.description = desc;
        if ((lawcat.isCategoryExist(mycat)) == null){
            lawcat.save();
            flash("success", mycat + " successfully saved " );
            return ok(views.html.admin_register_law_cat.render("success"));
        }
        else {
            flash("error", mycat + " Category already exist " );
            return badRequest(views.html.admin_register_law_cat.render("error"));
        }
    }


    // View Admin sign function
    public static Result adminLogin(){

            // Find user session
            boolean Session =  session().get("adminlog") !=null;
            if(Session){
            return redirect(routes.AdminDashboard.DashboardIndex());
             }else{
                return ok(signin_admin.render("welcome"));
              }
         }

//         Signin  admin function

    public static Result adminSignCreate(){

        // get form's email and password
        DynamicForm myloginForm = new DynamicForm().bindFromRequest();
        String email = myloginForm.get("email");
        String Inpassword = myloginForm.get("password");

          //Access admin  model
         AdminAccount admin  = new AdminAccount();

          // fetch data from agent table using input email method
         AdminAccount user = admin.isEmailExist(email);

        // Decrypt hashed password and compare it to input password
        // check if email exist and if password match then return fetched id then continue
//        if ((admin.isEmailExist(email))!=null  && BCrypt.checkpw(Inpassword, user.password)){

        if ((admin.isEmailExist(email))!=null  &&(user.password.equals(Inpassword))){

            long myid = user.id;
            String id =  Long.toString(myid);

               // Clear existing session
             session().clear();
                 //create new session
               session("adminlog", id);

            return  redirect("/dashboard");
        }
        else {

            flash("error", "Invalid email or password ");
            return  ok(signin_admin.render("error"));
        }
    }



      // Admin register method
    public static Result adminLoginCreateAcount(){

        DynamicForm signupForm = new DynamicForm().bindFromRequest();
        AdminAccount user = new AdminAccount();
        user.fullname =signupForm.field("fullname").value();
        user.email =signupForm.field("email").value();
        String Texpassword =signupForm.field("password").value();
//        user.password = BCrypt.hashpw(Texpassword, BCrypt.gensalt());
        user.password = Texpassword;

        String email = signupForm.get("email");
        if ((user.isEmailExist(email) ) == null){
            user.save();
            flash("success", "successfully registered");
            return ok(views.html.adminaccounts.render("success"));
        }
        else {
            flash("error", "User with email : " +email+ " aleready exist");
            return badRequest(adminaccounts.render("error"));
         }
       }

    public static Result Inquiries(){
        return ok(admin_citizeninquiries.render(" "));
    }

    public static Result LawDetails(Long id){      /*when a law law category is clicked laws will appear */
        List<Laws>list = Laws.GetLawsByCatId(id);
//        String ur = request().uri();
//        System.out.println(ur);
        return ok(citizen_law_details.render(list) );
     }

  public static Result LawComment(Long id){  /*when a law on list is clicked comment form will appear */
        Laws law = Laws.FindLaws.byId(id);
      return ok(citizen_law_comment.render("",law));
    }

  public static Result PostComment(){    // when comment button is clicked comment will be saved
      DynamicForm CommentForm = new DynamicForm().bindFromRequest();
      Comments comment = new Comments();
      comment.citizen_name =CommentForm.field("names").value();
      comment.citizen_identity =CommentForm.field("identity").value();
      String lawid = CommentForm.field("lawid").value();
      comment.law = Laws.FindLaws.byId(Long.parseLong(lawid));
      comment.suggestion =CommentForm.field("comment").value();
      comment.save();

       Laws law = Laws.FindLaws.byId(Long.parseLong(lawid));

         flash("commented", "Thanks for your comment");
          return ok(views.html.citizen_law_comment.render("commented",law));
      }

    // get detailed chat of citizen when his name on the list is clicked
    public static Result ChatDetails(String id){
        List<Inquiries> inquiry = Inquiries.FindCitizenChat(id);
        return ok(admin_chatposts.render("", inquiry));
    }

    //    when an admin replies to the agent
    public static Result ReplyChat(){
        DynamicForm signupForm = new DynamicForm().bindFromRequest();
        String adminid = session().get("adminlog");
        System.out.println(adminid);
        String reply =signupForm.field("message").value();
        String chatid =signupForm.field("replyid").value();
        Timestamp replytime = new Timestamp(new Date().getTime());
        SqlUpdate update = Ebean. createSqlUpdate("update inquiries set admin_id=:admin_id, reply=:reply,replied_at=:replied_at  WHERE id=:id")
                .setParameter("admin_id", adminid)
                .setParameter("reply", reply)
                .setParameter("replied_at", replytime)
                .setParameter("id", chatid);
        int rowsCount = update.execute();
        flash("success", "Reply successfully sent");
        return ok(admin_citizeninquiries.render("success"));
    }



}
