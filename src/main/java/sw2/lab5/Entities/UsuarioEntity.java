package sw2.lab5.Entities;

import javax.persistence.*;
import javax.validation.constraints.Digits;

@Entity
@Table(name = "user")
public class UsuarioEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_user")
    private int iduser;
    @Column(name = "firstName",nullable = false)
    private String firstname;
    @Column(name = "lastName",nullable = false)
    private String lastname;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String password;
    private String intro;
    private String profile;
    @Column(nullable = false)
    private boolean active;
    @ManyToOne
    @JoinColumn(name = "id_role",nullable = false)
    private Rol rol;

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }
}
