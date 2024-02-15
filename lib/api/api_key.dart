
class ApiKey{
  static String apiKey = "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";

  static String openAiLinks = "https://api.openai.com/v1/images/generations";

  static final headers = {
    "Content-Type" : "application/json",
    "Authorization" : "Bearer $apiKey"
  };
}