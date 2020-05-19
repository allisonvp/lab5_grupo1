package sw2.lab5.Entities;

import javax.persistence.*;

@Entity
@Table(name="post")
public class PostEntity {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column(name="id_post")
    private int idpost;
    @ManyToOne
    @JoinColumn(nullable = false, name="author_id")
    private UsuarioEntity user;
    @Column(nullable = false)
    private String title;
    private String summary;
    @Column(nullable = false)
    private boolean published;
    private String content;

    public int getIdpost() {
        return idpost;
    }

    public void setIdpost(int idpost) {
        this.idpost = idpost;
    }

    public UsuarioEntity getUser() {
        return user;
    }

    public void setUser(UsuarioEntity user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public boolean isPublished() {
        return published;
    }

    public void setPublished(boolean published) {
        this.published = published;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
