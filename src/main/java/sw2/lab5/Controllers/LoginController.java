package sw2.lab5.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import sw2.lab5.Entities.UsuarioEntity;
import sw2.lab5.Repositories.UsuarioRepository;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UsuarioRepository usuarioRepository;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "login/form";
    }

    @GetMapping("/redirectByRole")
    public String redirectByRole(Authentication auth, HttpSession session){
        String rol = "";
        for (GrantedAuthority role : auth.getAuthorities()) {
            rol = role.getAuthority();
            break;
        }

        String username = auth.getName();
        UsuarioEntity usuarioEntity = usuarioRepository.findByEmail(username);
        session.setAttribute("usuario", usuarioEntity);

        if (rol.equals("admin")) {
            return "redirect:/post/";
        } else {
            return "redirect:/post/";
        }
    }
}
