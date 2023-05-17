# frozen_string_literal: true

class BoardForm
  include ActiveModel::Model
  include Validations::Board

  attr_accessor :name, :email, :width, :height, :mines

  validates :width,  presence: true, length: { in: 1..50 }
  validates :height, presence: true, length: { in: 1..50 }
  validates :mines,  presence: true, length: { in: 0..2500 }

  def save
    matrix = ::BoardMatrix::Generator
             .new(width: width.to_i, height: height.to_i, mines: mines.to_i)
             .call
    Board.new(name:, email:, matrix:).save
  end
end
