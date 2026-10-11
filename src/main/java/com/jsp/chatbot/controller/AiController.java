package com.jsp.chatbot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.chatbot.service.AiService;

@Controller
public class AiController {

    @Autowired
    private AiService aiService;

    // Open the home page
    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/ask")
    public String showChatPage() {
        return "chat";
    }

    @PostMapping("/chat")
    public String ask(
            @RequestParam("userText") String userText,
            Model model) {

        model.addAttribute("userText", userText);

        try {
            String answer = aiService.invokeGeminiModel(userText);
            model.addAttribute("answer", answer);
        } catch (Exception e) {
            e.printStackTrace();

            model.addAttribute(
                "error",
                "Unable to get an AI response: " + e.getMessage()
            );
        }

        return "chat";
    }
}