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
                        .maxTokens(300)
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