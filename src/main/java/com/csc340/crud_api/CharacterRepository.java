package com.csc340.crud_api;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Repository
public interface CharacterRepository extends JpaRepository<Character, Long> {

    List<Character> findByUniverse(String universe);

    List<Character> findByNameContainingIgnoreCase(String name);

    List<Character> findByRole(String role);

    @Query("SELECT c FROM Character c WHERE c.age > :age")
    List<Character> findCharactersOlderThan(@Param("age") double age);
}