class Kitten < ApplicationRecord
  validates :name, :age, presence: true
  validates :cuteness, :softness, inclusion: { in: (0..10).to_a }
end
