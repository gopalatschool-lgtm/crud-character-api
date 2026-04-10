package com.csc340.crud_api;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CharacterService {

    private final CharacterRepository repository;

    public CharacterService(CharacterRepository repository) {
        this.repository = repository;
    }

    public List<Character> getAllCharacters() {
        return repository.findAll();
    }

    public Optional<Character> getCharacterById(Long id) {
        return repository.findById(id);
    }

    public Character addCharacter(Character character) {
        return repository.save(character);
    }

    public Character updateCharacter(Long id, Character character) {
        return repository.findById(id).map(existing -> {
            existing.setName(character.getName());
            existing.setDescription(character.getDescription());
            existing.setRole(character.getRole());
            existing.setUniverse(character.getUniverse());
            existing.setAge(character.getAge());
            return repository.save(existing);
        }).orElse(null);
    }

    public boolean deleteCharacter(Long id) {
        return repository.findById(id).map(c -> {
            repository.delete(c);
            return true;
        }).orElse(false);
    }

    public List<Character> getCharactersByUniverse(String universe) {
        return repository.findByUniverse(universe);
    }

    public List<Character> searchCharactersByName(String name) {
        return repository.findByNameContainingIgnoreCase(name);
    }

    // FILTER BY ROLE
    public List<Character> getCharactersByRole(String role) {
        return repository.findByRole(role);
    }

    public List<Character> getCharactersOlderThan(double age) {
        return repository.findCharactersOlderThan(age);
    }
}