package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.SportsclassDTO;

import java.util.List;

public interface SportsclassService {
    List<SportsclassDTO> sportsclassSelectAll(SportsclassDTO dto);
    int sportsclassCount();

}