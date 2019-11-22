# frozen_string_literal: true

# Data Storage model
class DataStorage < ApplicationRecord
  acts_as_eventable prefix: 'data_storage', on: %i[create update]

  belongs_to :user

  validates :key, :value, presence: true
  validates_length_of :value, maximum: 5120 # maximum 5kb of data

  def as_json_for_event_api
    {
      user: user.as_json_for_event_api,
      key: key,
      value: value,
      created_at: format_iso8601_time(created_at),
      updated_at: format_iso8601_time(updated_at)
    }
  end
end
