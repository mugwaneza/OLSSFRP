package models;

import play.data.validation.Constraints;
import play.db.ebean.Model;
import play.libs.Json;
import play.mvc.Result;

import javax.persistence.*;
import java.sql.Timestamp;
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
    public String Law_name;

    @Column
    @Constraints.Required
    public String Law_number;

    @Column
    @Constraints.Required
    public String description;

    public Timestamp Created_at = new Timestamp(new Date().getTime());

    public static Finder<Long,Laws> FindLaws= new Finder<>(Long.class,Laws.class);

    public static List<Laws> ListInfoLaws() {
        return FindLaws.all();
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
}