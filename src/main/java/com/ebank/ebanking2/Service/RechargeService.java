package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.dto.RechargeDTO;
import com.ebank.ebanking2.model.dto.RechargeResDTO;
import com.ebank.ebanking2.model.entity.CCourant;
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
    @Autowired
    CompteService compteService;


    public RechargeResDTO recharger(RechargeDTO rechargeDTO) {

        Recharge recharge=rechargeMapper.ToEntity(rechargeDTO);
        CCourant courant=compteService.getCompteByRib(rechargeDTO.getRib());
        recharge.setCompte(courant);
        compteService.diminuerSolde(courant,rechargeDTO.getMontant());
        rechargeRepo.save(recharge);
        RechargeResDTO rechargeDTORes=rechargeMapper.ToResDTO(rechargeRepo.save(recharge));
        return rechargeDTORes;

    }
}
