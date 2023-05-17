# frozen_string_literal: true

module BoardMatrix
  class Presenter
    attr_reader :board

    def initialize(board:)
      @board = board
    end

    def to_s
      board.matrix.map { |row| row.join(' ') }.join("\n")
    end
  end
end
