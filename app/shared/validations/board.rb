# frozen_string_literal: true

module Validations
  module Board
    extend ActiveSupport::Concern

    included do
      validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
      validates :name, presence: true, length: { in: 3..50 }
    end
  end
end
