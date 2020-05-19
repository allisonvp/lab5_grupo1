package sw2.lab5.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sw2.lab5.Entities.PostEntity;
import sw2.lab5.Entities.UsuarioEntity;
import sw2.lab5.Repositories.PostRepository;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

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

    @GetMapping(value = "/new")
    public String nuevoPost(){
        return "post/create";
    }

    @PostMapping(value="/save")
    public String guardarPost(PostEntity postEntity,HttpSession session){
        UsuarioEntity user = (UsuarioEntity) session.getAttribute("user");
        if(postEntity.getIdpost()==0){
            List<PostEntity> listPost = postRepository.buscarPostPorAutor(user);
            postRepository.save(listPost);
        }
        postRepository.save(listPost);
        return "redirect:/post/list";
    }


    @GetMapping("/delete")
    public String borrarPost(@RequestParam("id") int id,HttpSession session, Model model){
        UsuarioEntity user = (UsuarioEntity) session.getAttribute("user");

        List<PostEntity> postEntities = postRepository.buscarPostPorAutor(user);

            postRepository.deleteById(id);

        return "redirect:/post/list";

    }

}
