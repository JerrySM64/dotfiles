{ config, inputs, ... }:

{
  nix.settings = {
    substituters = [ "https://nix-amd-ai.cachix.org" ];
    trusted-public-keys = [
      "nix-amd-ai.cachix.org-1:F4OU4vw/lV2oiG6SBHZ+nqjl4EFJuqI4X9A7pvaBmhQ="
    ];
  };

  hardware.amd-npu = {
    enable = true;
    enableNPU = false;
    enableFastFlowLM = false;
    enableROCm = false;
    enableVulkan = true;
    enableLemonade = true;
    lemonade = {
      user = "Jerry";
      desktopApp.enable = false;
      customModels = {
        "Qwen3.6-35B-A3B-Hybrid" = {
           checkpoints.main = "unsloth/Qwen3.6-35B-A3B-GGUF:UD-Q4_K_M";
           recipe = "llamacpp";
           recipe_options = {
             ctx_size = 32768;
             llamacpp_args = "--n-cpu-moe 36";
           };
           labels = [ "chat" "reasoning" "tool-calling" ];
        };

        "Qwen3.5-9B" = {
          checkpoints.main = "unsloth/Qwen3.5-9B-GGUF:UD-Q4_K_M";
          recipe = "llamacpp";
          recipe_options.ctx_size = 131072;
           labels = [ "chat" "reasoning" "tool-calling" ];
        };
      };
    };
  };

  users.users.jerry.extraGroups = [ "video" "render" ];
}
