package com.jsp.chatbot.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.genai.Client;
import com.google.genai.types.GenerateContentResponse;

@Service
public class AiService {

    private final Client client;

    public AiService(
            @Value("${google.api.key}") String apiKey) {

        this.client = Client.builder()
                .apiKey(apiKey)
                .build();
    }

    public String invokeGeminiModel(String userText) {

        String prompt = """
                You are a helpful AI teacher.

                Answer the following question in simple
                language so that a beginner can understand it.

                Question:
                %s
                """.formatted(userText);

        GenerateContentResponse response =
                client.models.generateContent(
                        "gemini-3.8-flash",
                        prompt,
                        null
                );

        return response.text();
    }
}