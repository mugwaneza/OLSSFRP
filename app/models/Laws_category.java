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
@Table(name = "laws_category")
public class Laws_category extends Model {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false, nullable = false)
    public Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    public AdminAccount admin ;

    @Column
    @Constraints.Required
    public String category_name;

    @Column
    @Constraints.Required
    public String description;

    public Timestamp Created_at = new Timestamp(new Date().getTime());

    public static Model.Finder<Long, Laws_category> findLawsCat = new Model.Finder<>(Long.class,Laws_category.class);

    public  static  List<Laws_category> LawsCatList (String session){
        return findLawsCat.where().eq("admin_id", session).findList();
    }

    public static List<Laws_category> ListLawsCategories() {  // List all categories
        return findLawsCat.all();
    }


    public static Laws_category isCategoryExist(String lawcat) {
        return  findLawsCat.where()
                .eq("category_name",lawcat).findUnique();
    }

}
