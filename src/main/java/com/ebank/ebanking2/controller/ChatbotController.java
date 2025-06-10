package com.ebank.ebanking2.controller;

import com.ebank.ebanking2.Service.ChatbotService;
import com.ebank.ebanking2.model.dto.ChatRequestDTO;
import com.ebank.ebanking2.model.dto.CompteResDTO;
import com.ebank.ebanking2.util.ChatResponse;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/chatbot")
@CrossOrigin(origins = "http://localhost:4200/")
public class ChatbotController {

    private final ChatbotService chatbotService;
    private final ObjectMapper objectMapper;

    @Autowired
    public ChatbotController(ChatbotService chatbotService, ObjectMapper objectMapper) {
        this.chatbotService = chatbotService;
        this.objectMapper = objectMapper;
    }

    @PreAuthorize("hasRole('CLIENT') or hasRole('EMPLOYEE')")
    @PostMapping
    public ChatResponse chat(@RequestBody ChatRequestDTO chatRequestDTO) {
        String response = chatbotService.chat(chatRequestDTO.getMessage());

        // Analyse la réponse pour détecter si c'est une liste de comptes
        try {
            List<CompteResDTO> comptes = objectMapper.readValue(response, new TypeReference<List<CompteResDTO>>(){});
            return new ChatResponse("", comptes, "comptes");
        } catch (Exception e) {
            return new ChatResponse(response, null, "text");
        }
    }
}
