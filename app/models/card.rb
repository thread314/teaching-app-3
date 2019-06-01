class Card < ApplicationRecord
	has_many :cardstates, dependent: :destroy
	has_many :levels, dependent: :destroy
end
