package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.StatsService;
import com.ebank.ebanking2.model.dto.BalanceDistributionDTO;
import com.ebank.ebanking2.model.dto.CurrentAccountsSummaryStatsDto;
import com.ebank.ebanking2.model.dto.DashboardStatsResDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/stats")

public class StatsController {
    @Autowired
    StatsService statsService;
    @GetMapping
    @PreAuthorize("hasRole('EMPLOYEE')")
    public ResponseEntity<DashboardStatsResDTO> getStats() {
        return ResponseEntity.ok(this.statsService.getStatsForDash());
    }
    @GetMapping("/clients/monthly")
    public ResponseEntity<Map<String, Long>> getMonthlyClientStats() {
        return ResponseEntity.ok(statsService.getClientInscriptionsByMonth());
    }

    @GetMapping("/clients/yearly")
    public ResponseEntity<Map<Integer, Long>> getYearlyClientStats() {
        return ResponseEntity.ok(statsService.getClientInscriptionsByYear());
    }
    @GetMapping("/ccourant/monthly")
    public ResponseEntity<Map<String, Integer>> getMonthlyStats(
            @RequestParam(defaultValue = "halfYear",name = "filter") String filter,
            @RequestParam(defaultValue = "6",name = "limit") int limit) {
        Map<String, Integer> stats = statsService.getMonthlyAccountOpenings(filter, limit);
        return ResponseEntity.ok(stats);
    }

    @GetMapping("/ccourant/yearly")
    public ResponseEntity<Map<String, Integer>> getYearlyStats(
            @RequestParam(defaultValue = "halfYear",name = "filter") String filter,
            @RequestParam(defaultValue = "6",name="limit") int limit) {
        Map<String, Integer> stats = statsService.getYearlyAccountOpenings(filter, limit);
        return ResponseEntity.ok(stats);
    }
    @GetMapping("/balance-distribution")
    public ResponseEntity<BalanceDistributionDTO> getBalanceDistribution() {
        return ResponseEntity.ok(statsService.getBalanceDistribution());
    }
    @GetMapping("/summary")
    public ResponseEntity<CurrentAccountsSummaryStatsDto> getAccountSummary() {
        CurrentAccountsSummaryStatsDto summary = statsService.getAccountSummaryStats();
        return ResponseEntity.ok(summary);
    }

}
