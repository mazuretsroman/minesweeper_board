# frozen_string_literal: true

module BoardMatrix
  class Generator
    attr_reader :width, :height, :mines

    def initialize(width:, height:, mines:)
      @width = width
      @height = height
      @mines = mines
    end

    def call
      matrix = build_empty_matrix
      mines_count = format_mines_count
      while mines_count.positive?
        w = rand(width)
        h = rand(height)
        next if matrix[h][w]

        matrix[h][w] = true
        mines_count -= 1
      end
      matrix
    end

    private

    def build_empty_matrix
      Array.new(height) { Array.new(width, false) }
    end

    def format_mines_count
      return 0 if mines.negative?
      return width * height if mines > width * height

      mines
    end
  end
end
