package com.ebank.ebanking2.Service;

import com.ebank.ebanking2.model.entity.Compte;
import dev.langchain4j.agent.tool.P;
import dev.langchain4j.agent.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Component;

import java.util.List;

@Component // Ajoutez cette annotation
public class Chatbot {
    @Autowired
    CompteService compteService;

    @PreAuthorize("hasRole('EMPLOYEE') or #clientId == authentication.principal.id")
    @Tool("Retourne la liste des comptes du client connecté au format JSON, Chaque compte contient son RIB, son type")
    public List<?> getComptes(@P("ID du client") @org.springframework.security.access.method.P("clientId") Long clientId, String type, String status) {
        return compteService.getComptes(clientId, type, status);
    }
}
