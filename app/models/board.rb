# frozen_string_literal: true

class Board < ApplicationRecord
  include ::Validations::Board

  validates :matrix, presence: true
end
