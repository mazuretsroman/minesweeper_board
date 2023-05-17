# frozen_string_literal: true

class BoardForm
  include ActiveModel::Model
  include Validations::Board

  attr_accessor :name, :email, :width, :height, :mines

  validates :width,  presence: true, length: { in: 1..50 }
  validates :height, presence: true, length: { in: 1..50 }
  validates :mines,  presence: true, length: { in: 0..2500 }

  def save
    matrix = ::Matrix::Generator.new(width:, height:, mines:).call
    Board.new(name:, email:, matrix:).save
  end
end
