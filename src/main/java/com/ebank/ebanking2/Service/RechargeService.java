package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.RechargeDTO;
import com.ebank.ebanking2.model.entity.Recharge;
import com.ebank.ebanking2.model.mapper.RechargeMapper;
import com.ebank.ebanking2.repository.RechargeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class RechargeService {

    @Autowired
    RechargeRepo rechargeRepo;
    @Autowired
    RechargeMapper rechargeMapper;

//    public ResponseEntity<RechargeDTO> recharger(RechargeDTO rechargeDTO) {
//
//        Recharge recharge=rechargeMapper.ToRecharge(rechargeDTO);
//        recharge.setCreatedAt(LocalDateTime.now());
//        RechargeDTO rechargeDTORes=rechargeMapper.ToRechargeDTO(rechargeRepo.save(recharge));
//        return new ResponseEntity<>(rechargeDTORes, HttpStatus.CREATED);
//
//    }
}
