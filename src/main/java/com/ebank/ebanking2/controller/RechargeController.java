package com.ebank.ebanking2.controller;


import com.ebank.ebanking2.Service.RechargeService;
import com.ebank.ebanking2.model.dto.RechargeDTO;
import com.ebank.ebanking2.model.dto.RechargeResDTO;
import com.ebank.ebanking2.model.mapper.RechargeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/recharges")
@CrossOrigin
public class RechargeController {

    @Autowired
    private RechargeService rechargeService;

    @PostMapping("effectuer")
    public ResponseEntity<RechargeResDTO> recharger(@RequestBody RechargeDTO rechargeDTO) {
        RechargeResDTO rechargeResDTO=rechargeService.recharger(rechargeDTO);
        return  new ResponseEntity<>(rechargeResDTO, HttpStatus.OK);
    }
}
