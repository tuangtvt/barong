# frozen_string_literal: true

module API
  module V2
    module Entities
      # data storage retrieval entity
      class DataStorage < API::V2::Entities::Base
        expose :key, documentation: { type: 'String', desc: 'any additional data key' }
        expose :value, documentation: { type: 'String', desc: 'any additional data value' }

        with_options(format_with: :iso_timestamp) do
          expose :created_at
          expose :updated_at
        end
      end
    end
  end
end
