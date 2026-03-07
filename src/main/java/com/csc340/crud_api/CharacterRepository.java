package com.csc340.crud_api;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CharacterRepository extends JpaRepository<Character, Long> {

    List<Character> findByUniverse(String universe);

    List<Character> findByNameContainingIgnoreCase(String name);
}