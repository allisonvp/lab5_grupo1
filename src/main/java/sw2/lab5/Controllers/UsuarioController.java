package sw2.lab5.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sw2.lab5.Entities.UsuarioEntity;
import sw2.lab5.Repositories.UsuarioRepository;

import javax.validation.Valid;
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
    public String crearRegion(@ModelAttribute("user") UsuarioEntity user) {

        return "user/formUsuarios";
    }

    @PostMapping("/save")
    public String guardarRegion(@ModelAttribute("region") @Valid UsuarioEntity user,
                                BindingResult bindingResult,
                                RedirectAttributes attr) {
      /**  if (bindingResult.hasErrors()) {
            return "user/formUsuarios";
        } else if (region.getRegionid() == 0) {


        }
        attr.addFlashAttribute("msg", "Región exitosamente actualizada");
        regionRepository.save(region);*/
        return "redirect:/regions/list";
    }

}
