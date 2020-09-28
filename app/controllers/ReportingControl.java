package controllers;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.SqlUpdate;
import models.AdminAccount;
import org.mindrot.jbcrypt.BCrypt;
import play.data.DynamicForm;
import play.db.ebean.Model;
import play.mvc.Controller;
import play.mvc.Http;
import play.mvc.Result;
import scalax.file.Path;
import java.nio.file.Paths;

import java.io.File;
import java.util.*;

import static play.data.Form.form;

public class ReportingControl extends Controller {

    public  static  DynamicForm myform;


    public static Result ListCategories(){

        return ok(views.html.admin_listcategories.render(""));
    }


    public static Result LisLaws(){
        return ok(views.html.admin_listing_laws.render(""));
    }

    public static Result ShowAdmins(){
        return ok(views.html.admin_managementofaccounts.render(""));
    }
    public static Result EditAdmins(Long id){
        AdminAccount admin = AdminAccount.FindAdmin.byId(id);
        return ok(views.html.admin_edit_account.render("", admin));
    }
    // delete  admin row using variables capture from table with javascript file called all_agents_style


    // update admin row using variables capture from table with javascript file called all_agents_style
    public static Result UpdateAdmins(){

        myform  = form().bindFromRequest();
        String adminid = myform.field("id").value();
        String fullname = myform.field("fullname").value();
        String email = myform.field("email").value();
        String Texpassword = myform.field("password").value();

        SqlUpdate update = Ebean. createSqlUpdate("UPDATE admin SET fullname=:fullname, email=:email, password=:password WHERE id=:id")
                .setParameter("fullname", fullname)
                .setParameter("email", email)
                .setParameter("password", Texpassword)
                .setParameter("id", adminid);
        int rows = update.execute();


        flash("success", "Admin account successfully updated");

        return ok(views.html.admin_managementofaccounts.render("success"));
    }

    public static Result DeleteAdminAccount(Long id){
    SqlUpdate update = Ebean. createSqlUpdate("update admin set status=:status WHERE id=:id")
            .setParameter("status", 0)
            .setParameter("id", id);
            int rowsCount = update.execute();
        flash("success", "Admin successfully deleted");
        return redirect(routes.ReportingControl.ShowAdmins());
    }


    public static Result SendMessage(){
        return ok();
    }



}
