Dir[Pathname.new(__FILE__).dirname.join("adapters", "*.rb")].sort.each { |file| require file }

module Langchain
  class Assistant
    module LLM
      # TODO: Fix the message truncation when context window is exceeded
      class Adapter
        def self.build(llm)
          case llm
          when Langchain::LLM::Anthropic
            LLM::Adapters::Anthropic.new(llm)
          when Langchain::LLM::GoogleGemini, Langchain::LLM::GoogleVertexAI
            LLM::Adapters::GoogleGemini.new(llm)
          when Langchain::LLM::MistralAI
            LLM::Adapters::MistralAI.new(llm)
          when Langchain::LLM::Ollama
            LLM::Adapters::Ollama.new(llm)
          when Langchain::LLM::OpenAI
            LLM::Adapters::OpenAI.new(llm)
          else
            raise ArgumentError, "Unsupported LLM type: #{llm.class}"
          end
        end
      end
    end
  end
end
