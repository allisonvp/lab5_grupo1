package sw2.lab5.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sw2.lab5.Entities.UsuarioEntity;
import sw2.lab5.Repositories.UsuarioRepository;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

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
    public String editarRegion(@ModelAttribute("user") @Valid UsuarioEntity user,
                               @RequestParam("id") int id,
                               Model model) {
        Optional<UsuarioEntity> opt = usuarioRepository.findById(id);
        if (opt.isPresent()) {
            user = opt.get();
            model.addAttribute("user",user);
            return "/user/formUsuarios";
        } else {
            return "redirect:/user/list";
        }
    }

    @PostMapping("/save")
    public String guardarRegion(@ModelAttribute("user") @Valid UsuarioEntity user,
                                BindingResult bindingResult,
                                RedirectAttributes attr) {
        if (bindingResult.hasErrors()) {
            return "user/formUsuarios";
        }
        attr.addFlashAttribute("msg", "Usuario exitosamente actualizado");
        usuarioRepository.save(user);
        return "redirect:/user/list";
    }

}
