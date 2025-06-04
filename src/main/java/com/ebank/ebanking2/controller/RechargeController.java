package com.ebank.ebanking2.controller;


import com.ebank.ebanking2.Service.RechargeService;
import com.ebank.ebanking2.model.dto.RechargeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/recharges")
public class RechargeController {

    @Autowired
    private RechargeService rechargeService;

//    @PostMapping("effectuer")
//    public ResponseEntity<RechargeDTO> recharger(@RequestBody RechargeDTO rechargeDTO) {
//        return rechargeService.recharger(rechargeDTO);
//    }
}
