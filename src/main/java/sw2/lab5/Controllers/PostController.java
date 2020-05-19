package sw2.lab5.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import sw2.lab5.Entities.PostEntity;
import sw2.lab5.Entities.UsuarioEntity;
import sw2.lab5.Repositories.PostRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/post")
public class PostController {

    @Autowired
    PostRepository postRepository;

    @GetMapping(value = {"/list","/"})
    public String listarPost(Model model, HttpSession session) {

        UsuarioEntity user = (UsuarioEntity) session.getAttribute("user");
        model.addAttribute("listaPost", postRepository.buscarPostPorAutor(user));

        return "post/list";
    }



}
