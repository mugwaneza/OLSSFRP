package models;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.Expr;
import com.avaje.ebean.ExpressionList;
import com.avaje.ebean.SqlUpdate;
import com.avaje.ebean.annotation.Formula;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import play.api.db.DB;
import play.data.validation.Constraints;
import play.db.ebean.Model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name ="laws")
public class Laws extends Model {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false, nullable = false)
    public Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    public Laws_category cat ;

    @ManyToOne(cascade = CascadeType.ALL)
    public AdminAccount admin ;

    @Column
    @Constraints.Required
    public String law_name;

    @Column
    @Constraints.Required
    public String law_number;

    @Column
    @Constraints.Required
    public String description;

    @Column
    public boolean status;

    public Timestamp Created_at = new Timestamp(new Date().getTime());

    public static Model.Finder<Long,Laws> FindLaws= new Model.Finder<>(Long.class,Laws.class);

    public static List<Laws> ListInfoLaws() {
        return FindLaws.where().eq("status", 1).findList();
    }



    public static Laws isLawExist(String law) {
        return  FindLaws.where()
                .eq("law_name",law).findUnique();
    }



    // List all laws accordingly
    public static List<Laws> GetLawsByCatId(Long id)
    {
        List<Laws> law ;
        law = FindLaws.where().eq("cat_id", id).findList();
        return  law;
    }

    // List law by name or law number on search
    public static List<Laws> SearchLaw(String name)
    {
        List<Laws> law ;
        law = FindLaws.where().eq("status",true).or(Expr.contains("law_number", name ),Expr.contains("law_name", name)).findList();
        return  law;
    }
}
