package com.ebank.ebanking2.Service.chatService;


import com.ebank.ebanking2.model.dto.chatdto.ChatRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {

    private final Assistant assistant;

    @Override
    public String getChatResponse(ChatRequest chatRequest) {
        return assistant.chat(chatRequest.userId(), chatRequest.question(), chatRequest.userId());
    }



//    public String getChatResponseSimple(ChatRequest chatRequest) {
//        List<ChatMessage> messages = new ArrayList<>();
//        //messages.add(SystemMessage.systemMessage("response in frensh"));
//        messages.add(UserMessage.userMessage(chatRequest.question()));
//        var model = OpenAiChatModel.builder()
//                .apiKey("demo")
//                .modelName(OpenAiChatModelName.GPT_4_O_MINI)
//                .build();
//        return model.generate(messages).content().text();
//    }
}
