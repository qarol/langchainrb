module Langchain
  class Assistant
    module LLM
      module Adapters
        class Base
          def build_chat_params(tools:, instructions:, messages:, tool_choice:)
            raise NotImplementedError, "Subclasses must implement build_chat_params"
          end

          def extract_tool_call_args(tool_call:)
            raise NotImplementedError, "Subclasses must implement extract_tool_call_args"
          end

          def build_message(role:, content: nil, image_url: nil, tool_calls: [], tool_call_id: nil)
            raise NotImplementedError, "Subclasses must implement build_message"
          end

          def tool_role
            raise NotImplementedError, "Subclasses must implement tool_role"
          end

          def support_system_message?
            raise NotImplementedError, "Subclasses must implement set_instructions"
          end
        end
      end
    end
  end
end
