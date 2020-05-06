package com.example.tacocloud.controller;

import com.example.tacocloud.model.Ingredient;
import com.example.tacocloud.model.Order;
import com.example.tacocloud.model.Taco;
import com.example.tacocloud.model.User;
import com.example.tacocloud.repository.IngredientRepository;
import com.example.tacocloud.repository.TacoRepository;
import com.example.tacocloud.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static com.example.tacocloud.model.Ingredient.Type;

@Slf4j
@Controller
@RequestMapping("/design")
@SessionAttributes("order")
public class DesignTacoController {

    private final IngredientRepository ingredientRepo;

    private TacoRepository tacoRepo;

    private UserRepository userRepo;

    @Autowired
    public DesignTacoController(
            IngredientRepository ingredientRepo,
            TacoRepository tacoRepo, UserRepository userRepo) {
        this.ingredientRepo = ingredientRepo;
        this.tacoRepo = tacoRepo;
        this.userRepo = userRepo;
    }

    @ModelAttribute(name = "order")
    public Order order() {
        return new Order();
    }

    @ModelAttribute(name = "design")
    public Taco design() {
        return new Taco();
    }

    @GetMapping
    public String showDesignForm(Model model, Principal principal) {
        log.info("===start get mapping===");
        List<Ingredient> ingredients = new ArrayList<>();
        ingredientRepo.findAll().forEach(ingredients::add);

        Type[] types = Ingredient.Type.values();
        for (Type type : types) {
            model.addAttribute(type.toString().toLowerCase(),
                    filterByType(ingredients, type));
        }
        String username = principal.getName();
        User user = userRepo.findByUsername(username);
        model.addAttribute("user", user);
        log.info("===end get mapping===");
        return "design";
    }

    @PostMapping
    public String processDesign(
            @Valid Taco taco, Errors errors,
            @ModelAttribute Order order) {
        log.info("===start post mapping===");
        if (errors.hasErrors()) {
            log.info("====errors===");
            return "design";
        }

        Taco saved = tacoRepo.save(taco);
        order.addDesign(saved);
        log.info("===end post mapping===");
        return "redirect:/orders/current";
    }

    private List<Ingredient> filterByType(
            List<Ingredient> ingredients, Type type) {
        return ingredients
                .stream()
                .filter(x -> x.getType().equals(type))
                .collect(Collectors.toList());
    }
}