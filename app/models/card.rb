class Card < ApplicationRecord
	has_many :cardstates
	has_many :levels
end