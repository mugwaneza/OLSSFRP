package models;


import com.avaje.ebean.Ebean;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import play.data.validation.Constraints;
import play.db.ebean.Model;

import javax.persistence.*;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "inquiries")
public class Inquiries  extends Model {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false, nullable = false)
    public Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    public AdminAccount admin ;

    @Column
    @Constraints.Required
    public String inquery;

    @Column
    @Constraints.Required
    public String citizen_name;

    @Column
    @Constraints.Required
    public String citizen_identification;

   @Column
    @Constraints.Required
    public boolean reply;

    @Column
    @Constraints.Required
    public String replied_at;

    public Timestamp created_at = new Timestamp(new Date().getTime());


    public static Model.Finder<Long,Inquiries> InquiryFinder = new  Model.Finder<>(Long.class,Inquiries.class);


    // chats in agent dashboard
    public static List<Inquiries> FindAgentChat(String agentid)
    {
        List<Inquiries> agentinq;
        agentinq = Inquiries.InquiryFinder.where().eq("agents_id",agentid).orderBy("id desc").findList();

        return agentinq;
    }


    // Detail chat of each message sender in admin
    public static List<Inquiries> agentChat(String id)
    {
        List<Inquiries> agentc ;
        agentc = InquiryFinder.where().eq("agents_id", id).findList();
        return  agentc;
    }

    public  static int Unread(){

        try {
         return  InquiryFinder.where("agents_id IS NOT NULL AND reply_status=false GROUP BY agents_id ").findRowCount();

        }
        catch (Exception  e) {
          System.out.println(e);
            }

      return 0;
    }




}
