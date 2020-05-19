package sw2.lab5.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import sw2.lab5.Entities.UsuarioEntity;
import sw2.lab5.Repositories.UsuarioRepository;

import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UsuarioController {
    @Autowired
    UsuarioRepository usuarioRepository;

    @GetMapping(value= {"","/list"})
    public String listarRegiones(Model model) {
        List<UsuarioEntity> listaUser = usuarioRepository.findAll();
        model.addAttribute("lista", listaUser);
        return "user/listaUsuarios";
    }
    @GetMapping("/edit")
    public String crearRegion(@ModelAttribute("region") UsuarioEntity user) {

        return "user/formUsuario";
    }



}
