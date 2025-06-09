package com.ebank.ebanking2.controller.chatController;

import com.ebank.ebanking2.Service.chatService.ChatService;
import com.ebank.ebanking2.model.dto.chatdto.ChatRequest;
import com.ebank.ebanking2.model.dto.chatdto.ChatResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/chat")
public class ChatController {
    private final ChatService chatService;
    @PostMapping
    public ChatResponse getChatResponse(@RequestBody ChatRequest chatRequest){
        return new ChatResponse(chatService.getChatResponse(chatRequest));
    }
}
