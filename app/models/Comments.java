package models;

import play.data.validation.Constraints;
import play.db.ebean.Model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Entity
@Table(name ="comments")
public class Comments extends Model {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false, nullable = false)
    public Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    public Laws law;

    @Column
    @Constraints.Required
    public String citizen_identity;

    @Column
    @Constraints.Required
    public String citizen_name;

    @Column
    @Constraints.Required
    public String suggestion;

    public Timestamp Created_at = new Timestamp(new Date().getTime());

    public static Model.Finder<Long,Comments> CommentsFinder = new Model.Finder<>(Long.class,Comments.class);

    public static List<Comments> ListComments() {
        return CommentsFinder.all();
    }






}
