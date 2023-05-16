# frozen_string_literal: true

class Board < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { in: 3..50 }
  validates :matrix, presence: true
end
