package models;


import play.data.validation.Constraints;
import play.db.ebean.Model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Entity
@Table(name ="laws_review")
public class Laws_review extends Model {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false, nullable = false)
    public Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    public Laws law;

    @Column
    @Constraints.Required
    public String country;

    public Timestamp visit_time = new Timestamp(new Date().getTime());


    public static Model.Finder<Long,Laws_review> FinderLawsReview = new Model.Finder<>(Long.class,Laws_review.class);

    public static List<Laws_review> ListLawsReview() {
        return FinderLawsReview.all();
    }

}