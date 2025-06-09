package com.ebank.ebanking2.tools;

import com.ebank.ebanking2.Service.ClientService;
import com.ebank.ebanking2.model.dto.CompteResDTO;
import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class BankTools {
    private final ClientService clientService;

    @Tool
    public List<String> getRib(Long clientId) {
        List<CompteResDTO> compteResDTOList = clientService.getClientById(clientId).getComptes();
        List<String> ribs = compteResDTOList.stream()
                .map(compteResDTO -> compteResDTO.getRib())
                .toList();
        return ribs;
    }
}
