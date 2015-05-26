class Board < ActiveRecord::Base
  has_many :pins
  belongs_to :user
  belongs_to :parent_board, class_name: Board
#  has_many :child_boards, class_name: Board, foreign_key: "parent_board_id"
end
