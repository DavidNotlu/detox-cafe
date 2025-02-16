# Valentine's Syndrome 💔

### Inspiration
Valentine's Syndrome was inspired by the hackathon theme, which explores the impact of technology on our lives—whether it helps or traps us. The game acts as a metaphor for digital entrapment and addiction, symbolizing how something as engaging as a virtual AI girlfriend can become a trap. Convincing her to let you leave reflects the challenge of breaking free from unhealthy digital dependencies.

We also drew creative inspiration from **Doki Doki Literature Club**, blending psychological tension and storytelling to create an engaging and suspenseful experience.

---

### What It Does
In **Valentine's Syndrome**, the player is trapped in a house with a ChatGPT-powered virtual girlfriend. The AI dynamically responds to your dialogue choices, and your goal is simple: **convince her to let you leave before it's too late.**

- **Bad responses** make her increasingly suspicious and possessive, yelling, “You think you can trick me?!”
- **Good responses** eventually convince her to say, “Okay, you can leave.”

The game concludes with a **win screen** if you successfully escape or a **lose screen** if you fail.

---

### How We Built It
- **Engine:** Godot 4.3  
- **AI Integration:** OpenAI’s ChatGPT API for real-time, dynamic dialogue  
- **Development Tools:**
  - **Game Logic:** Input handling, dialogue parsing, and response validation
  - **Scenes:**
    - Main gameplay scene (house interior with dynamic AI dialogue)
    - Win screen (upon successful escape)
    - Lose screen (if the AI refuses to let you go)
- **Version Control:** Managed via GitHub—API keys and sensitive information are managed via environment variables to avoid exposure.
- **Chatbot Flow:** We engineered prompts to guide the AI in mimicking a clingy, overbearing girlfriend, with responses constrained to **7-word sentences** for gameplay consistency.

---

### Challenges We Ran Into
- **API Key Protection Issues:**  
  GitHub blocked our push when it detected exposed API keys. We resolved this by removing sensitive information from commits and using environment variables.
  
- **Switching from Unity to Godot:**  
  Transitioning to Godot 4.3 required adjusting to new syntax for JSON parsing and HTTPRequest, compared to Godot 3.
  
- **Ensuring AI Response Consistency:**  
  Prompt engineering was vital to keep ChatGPT's responses consistent with the game's rules (e.g., only 7-word sentences).
  
- **Collision & Movement Tweaks:**  
  Early movement felt clunky and needed tuning to ensure smooth gameplay in a 2D space.
  
- **UI Scaling Adjustments:**  
  Tweaks were necessary to keep the chatbox and game UI within screen bounds across different resolutions.

---

### Accomplishments We're Proud Of
- Successfully integrated ChatGPT for interactive, adaptive AI dialogue.
- Developed game mechanics that intricately tie into digital entrapment and detox themes.
- Implemented win/loss conditions based on dynamic AI dialogue responses.
- Seamlessly transitioned from Unity to Godot 4.3 while meeting hackathon deadlines.
- Overcame GitHub API key push protection while maintaining clean version control.

---

### What We Learned
- **Prompt Engineering:** Fine-tuning ChatGPT's responses requires trial and error.
- **AI in Games:** Integrating real-time AI enriches the player experience but demands careful rule-setting.
- **Godot 4 Development:** Mastering HTTPRequest, JSON parsing, and debugging in Godot 4 was an essential learning curve.
- **Rapid Game Development:** Hackathons force prioritization. We focused first on dialogue mechanics, then refined graphics and UI.
- **Version Control Best Practices:** Never commit API keys to GitHub—use environment variables for sensitive data.

---

### What's Next for Valentine's Syndrome ❤️
- **Expanded AI Memory:** Let ChatGPT recall previous conversations for more context-aware responses.
- **Multiple Endings:** Introduce alternative escape strategies (e.g., finding hidden items or calling for help).
- **Randomized AI Behavior:** Make her responses vary from day to day for increased replayability.
- **Voice Synthesis:** Integrate AI-generated voice lines for a creepier, more immersive experience.
- **Mobile Version:** Adapt the game for iOS and Android, so players can attempt an escape from anywhere.

---

### How to Play
1. Launch the game here: https://kalu4u.itch.io/valentines-syndrome-3
2. Engage in dialogue and choose your responses carefully.
3. Convince her to let you leave; choose poorly, and she becomes more possessive!
4. Escape successfully for the win screen, or fail and face the lose screen.

---

We hope you enjoy **Valentine's Syndrome**—a dark, twisted take on love, dependency, and the lure of digital entrapment.
