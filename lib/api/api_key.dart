
class ApiKey{
  static String apiKey = "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";

  static String openAiLinks = "https://api.openai.com/v1/images/generations";

  static final headers = {
    "Content-Type" : "application/json",
    "Authorization" : "Bearer $apiKey"
  };
}