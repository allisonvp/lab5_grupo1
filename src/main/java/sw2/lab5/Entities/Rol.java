package sw2.lab5.Entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "role")
public class Rol implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_role")
    private int idroles;
    @Column(nullable = false,name = "role_name")
    private String rolename;

    public int getIdroles() {
        return idroles;
    }

    public void setIdroles(int idroles) {
        this.idroles = idroles;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}
