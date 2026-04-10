package com.csc340.crud_api;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/characters")
public class CharacterMvcController {

    private final CharacterService service;

    public CharacterMvcController(CharacterService service) {
        this.service = service;
    }

    // GET all characters → gallery view
    @GetMapping
    public String getAllCharacters(Model model) {
        model.addAttribute("characterList", service.getAllCharacters());
        model.addAttribute("title", "All Characters");
        return "character-list";
    }


    // GET create form
    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("title", "Add New Character");
        return "character-create";
    }

    // POST save new character
    @PostMapping("/save")
    public String saveCharacter(@ModelAttribute Character character) {
        Character saved = service.addCharacter(character);
        return "redirect:/characters/" + saved.getCharacterId();
    }

    // GET update form (pre-populated)
    @GetMapping("/updateForm/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Character character = service.getCharacterById(id).orElse(null);
        model.addAttribute("character", character);
        model.addAttribute("title", "Update Character: " + id);
        return "character-update";
    }

    // POST update existing character
    @PostMapping("/update/{id}")
    public String updateCharacter(@PathVariable Long id, @ModelAttribute Character character) {
        service.updateCharacter(id, character);
        return "redirect:/characters/" + id;
    }

    // GET delete 
    @GetMapping("/delete/{id}")
    public String deleteCharacter(@PathVariable Long id) {
        service.deleteCharacter(id);
        return "redirect:/characters";
    }

    // Filter by age 
    @GetMapping("/age/{age}")
    public String getCharactersOlderThan(@PathVariable double age, Model model) {
        model.addAttribute("characterList", service.getCharactersOlderThan(age));
        model.addAttribute("title", "Characters Older Than " + (int) age);
        model.addAttribute("filterInfo", "Showing characters older than age: " + (int) age);
        return "character-list";
    }

    // GET one character by ID → details view
    @GetMapping("/{id}")
    public String getCharacterById(@PathVariable Long id, Model model) {
        Character character = service.getCharacterById(id).orElse(null);
        if (character != null) {
            model.addAttribute("character", character);
            model.addAttribute("title", character.getName());
        } else {
            model.addAttribute("errorMessage", "Character with ID " + id + " was not found.");
            model.addAttribute("title", "Error");
            return "error";
        }
        return "character-details";
    }

    // ── Extra Credit ──────────────────────────────────────────────

    // Filter by role
    @GetMapping("/role/{role}")
    public String getByRole(@PathVariable String role, Model model) {
        model.addAttribute("characterList", service.getCharactersByRole(role));
        model.addAttribute("title", "Role: " + role);
        model.addAttribute("filterInfo", "Showing characters with role: " + role);
        return "character-list";
    }

    // Search by name
    @GetMapping("/search")
    public String searchByName(@RequestParam String name, Model model) {
        model.addAttribute("characterList", service.searchCharactersByName(name));
        model.addAttribute("title", "Search: " + name);
        model.addAttribute("filterInfo", "Search results for: \"" + name + "\"");
        return "character-list";
    }

    
}