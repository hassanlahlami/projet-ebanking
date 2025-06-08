package com.ebank.ebanking2.controller;


import com.ebank.ebanking2.Service.RechargeService;
import com.ebank.ebanking2.model.dto.RechargeDTO;
import com.ebank.ebanking2.model.dto.RechargeResDTO;
import com.ebank.ebanking2.model.mapper.RechargeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/recharges")
@CrossOrigin
public class RechargeController {

    @Autowired
    private RechargeService rechargeService;



    @GetMapping("/{id}")
    public ResponseEntity<Page<RechargeResDTO>> getRechargesByCompte(@PathVariable("id") long id,@RequestParam("offset") Integer offset,@RequestParam("size") Integer size) {
        return ResponseEntity.ok(rechargeService.getAllRecharges(id, offset, size));
    }


    @PostMapping("effectuer")
    public ResponseEntity<RechargeResDTO> recharger(@RequestBody RechargeDTO rechargeDTO) {
        RechargeResDTO rechargeResDTO=rechargeService.recharger(rechargeDTO);
        return  new ResponseEntity<>(rechargeResDTO, HttpStatus.OK);
    }


//    @PostMapping("effectuer")
//    public ResponseEntity<RechargeDTO> recharger(@RequestBody RechargeDTO rechargeDTO) {
//        return rechargeService.recharger(rechargeDTO);
//    }
}
