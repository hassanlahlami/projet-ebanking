import { Component } from '@angular/core';
import { chatbotService } from '../../Service/chatbot.service';
import { ChatRequest } from '../../model/dto/ChatRequest';

interface Message {
  sender: 'user' | 'bot';
  text: string;
}

@Component({
  selector: 'chatbot',
  standalone:false,
  templateUrl: './chatbot.component.html',
  styleUrls: ['./chatbot.component.css']
})
export class ChatbotComponent {

  constructor(private chatbotService: chatbotService) {}

  isOpen = false;
  clientId = 1;

  clientQuestion = "";
  messages: Message[] = [];

  toggleChat() {
    this.isOpen = !this.isOpen;
  }

  closeChat() {
    this.isOpen = false;
  }

  send() {
    if (!this.clientQuestion.trim()) return; // ignore empty

    // Add user message to chat
    this.messages.push({ sender: 'user', text: this.clientQuestion });

    const chatRequest = {
      question: this.clientQuestion,
      userId: this.clientId
    };

    this.clientQuestion = ""; // clear input

    this.chatbotService.sendChat(chatRequest).subscribe({
      next: (chatResponse) => {
        // Add chatbot response to chat
        this.messages.push({ sender: 'bot', text: chatResponse.response });
      },
      error: (err) => {
        console.error("error in chat:", err);
        this.messages.push({ sender: 'bot', text: "Sorry, something went wrong." });
      }
    });
  }
}
