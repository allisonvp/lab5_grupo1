package sw2.lab5.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Digits;

@Entity
public class UsuarioEntity {
    @Id
    //@NotBlank
    @Digits(integer = 11, fraction = 0)
    @Column(name = "dni")
    private int idusuarios;
}
