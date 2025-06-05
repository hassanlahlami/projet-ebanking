package com.ebank.ebanking2.configuration;
import com.ebank.ebanking2.Service.Chatbot;
import com.ebank.ebanking2.Service.ChatbotService;
import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import dev.langchain4j.model.openai.OpenAiChatModel;
import dev.langchain4j.service.AiServices;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class LangChainConfig {

    @Bean
    public ChatbotService chatbotService(Chatbot chatbotTools) {
        return AiServices.builder(ChatbotService.class)
                .chatLanguageModel(OpenAiChatModel.builder()
                        .apiKey("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")
                        .baseUrl("https://openrouter.ai/api/v1")
                        .modelName("anthropic/claude-3-sonnet")
                        .temperature(0.2)
                        .topP(0.9)
                        .maxTokens(1024)
                        .build())
                .tools(chatbotTools)
                .chatMemory(MessageWindowChatMemory.withMaxMessages(10))
                .build();
    }

    @Bean
    public Chatbot chatbot() {
        return new Chatbot();
    }
}