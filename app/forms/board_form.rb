# frozen_string_literal: true

class BoardForm
  include ActiveModel::Model
  include Validations::Board

  SIZE_RANGE = (1..50)
  MINES_RANGE = (0..2500)

  attr_accessor :name, :email, :width, :height, :mines

  validates :width,  presence: true, numericality: { in: SIZE_RANGE }
  validates :height, presence: true, numericality: { in: SIZE_RANGE }
  validates :mines,  presence: true, numericality: { in: MINES_RANGE }

  def save
    return false unless valid?

    matrix = ::BoardMatrix::Generator
             .new(width: width.to_i, height: height.to_i, mines: mines.to_i)
             .call
    Board.new(name:, email:, matrix:).save
  end
end
