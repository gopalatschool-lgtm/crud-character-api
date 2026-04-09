package com.csc340.crud_api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/characters")
public class CharacterController {

    private final CharacterService service;

    public CharacterController(CharacterService service) {
        this.service = service;
    }

    // GET all characters
    @GetMapping
    public List<Character> getAll() {
        return service.getAllCharacters();
    }

    // GET character by ID
    @GetMapping("/{id}")
    public ResponseEntity<Character> getById(@PathVariable Long id) {
        return service.getCharacterById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // POST create new character
    @PostMapping
    public Character addCharacter(@RequestBody Character character) {
        return service.addCharacter(character);
    }

    // PUT update character
    @PutMapping("/{id}")
    public ResponseEntity<Character> updateCharacter(@PathVariable Long id, @RequestBody Character character) {
        Character updated = service.updateCharacter(id, character);
        if (updated == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(updated);
    }

    // DELETE character
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCharacter(@PathVariable Long id) {
        boolean deleted = service.deleteCharacter(id);
        return deleted ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }

    // FILTER by role
    @GetMapping("/role/{role}")
    public List<Character> getCharactersByRole(@PathVariable String role) {
        return service.getCharactersByRole(role);
    }

    // SEARCH by name
    @GetMapping("/search")
    public List<Character> searchByName(@RequestParam String name) {
        return service.searchCharactersByName(name);
    }

    @GetMapping("/age/{age}")
    public List<Character> getCharactersOlderThan(@PathVariable double age) {
        return service.getCharactersOlderThan(age);
    }
}