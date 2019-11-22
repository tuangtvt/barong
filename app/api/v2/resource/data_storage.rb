# frozen_string_literal: true

module API
  module V2
    module Resource
      class DataStorage < Grape::API
        resource :data_storage do
          desc 'Create an api key',
               security: [{ "BearerToken": [] }],
               failure: [
                 { code: 400, message: 'Required params are empty' },
                 { code: 401, message: 'Invalid bearer token' },
                 { code: 422, message: 'Validation errors' }
               ]
          params do
            requires :key,
                     type: String,
                     allow_blank: false
            requires :value,
                     type: String,
                     allow_blank: false
          end
          post do
            declared_params = declared(params)

            data_storage = current_user.data_storages.new(declared_params)

            code_error!(data_storage.errors.details, 422) unless data_storage.save

            status 201
          end
        end
      end
    end
  end
end
