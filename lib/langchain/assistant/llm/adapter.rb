# frozen_string_literal: true

module Langchain
  class Assistant
    module LLM
      # TODO: Fix the message truncation when context window is exceeded
      class Adapter
        def self.build(llm)
          if llm.is_a?(Langchain::LLM::Anthropic)
            LLM::Adapters::Anthropic.new(llm: llm)
          elsif llm.is_a?(Langchain::LLM::AwsBedrock) && llm.defaults[:chat_model].include?("anthropic")
            LLM::Adapters::AwsBedrockAnthropic.new(llm: llm)
          elsif llm.is_a?(Langchain::LLM::GoogleGemini) || llm.is_a?(Langchain::LLM::GoogleVertexAI)
            LLM::Adapters::GoogleGemini.new(llm: llm)
          elsif llm.is_a?(Langchain::LLM::MistralAI)
            LLM::Adapters::MistralAI.new(llm: llm)
          elsif llm.is_a?(Langchain::LLM::Ollama)
            LLM::Adapters::Ollama.new(llm: llm)
          elsif llm.is_a?(Langchain::LLM::OpenAI)
            LLM::Adapters::OpenAI.new(llm: llm)
          else
            raise ArgumentError, "Unsupported LLM type: #{llm.class}"
          end
        end
      end
    end
  end
end
