{ pkgs, ... }:

{
  services.ollama.enable = true;
  # services.ollama.loadModels = [ "llama3.2:3b" "dolphin-llama3:8b" "qwen2.5-coder:7b" "llava-llama3:8b" "phi3.5:3.8b" ];
  services.ollama.acceleration = "rocm";
  
  environment.systemPackages = with pkgs; [
    ollama
    # open-webui
    oterm
    # alpaca
    # nextjs-ollama-llm-ui
    aichat
  ];
}
