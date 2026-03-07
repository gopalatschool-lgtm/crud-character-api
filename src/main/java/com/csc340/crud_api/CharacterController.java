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

    @GetMapping
    public List<Character> getAll() {
        return service.getAllCharacters();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Character> getById(@PathVariable Long id) {
        return service.getCharacterById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Character addCharacter(@RequestBody Character character) {
        return service.addCharacter(character);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Character> updateCharacter(@PathVariable Long id, @RequestBody Character character) {
        Character updated = service.updateCharacter(id, character);
        if (updated == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(updated);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCharacter(@PathVariable Long id) {
        boolean deleted = service.deleteCharacter(id);
        return deleted ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }

    @GetMapping("/category/{category}")
    public List<Character> getByUniverse(@PathVariable String category) {
        return service.getCharactersByUniverse(category);
    }

    @GetMapping("/search")
    public List<Character> searchByName(@RequestParam String name) {
        return service.searchCharactersByName(name);
    }
}