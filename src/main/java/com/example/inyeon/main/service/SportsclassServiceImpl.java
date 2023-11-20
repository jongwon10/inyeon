package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.SportsclassDTO;
import com.example.inyeon.main.mapper.SportsclassMapper;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SportsclassServiceImpl implements SportsclassService {
    Logger logger = LogManager.getLogger(this.getClass());
    private final SportsclassMapper sportsclassMapper;
    @Override
    public List<SportsclassDTO> sportsclassSelectAll(SportsclassDTO dto) {


        return sportsclassMapper.sportsclassSelectAll(dto);
    }

    @Override
    public int sportsclassCount() {

        return sportsclassMapper.sportsclassCount();
    }
}