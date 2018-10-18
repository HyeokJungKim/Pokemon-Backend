class Family < ApplicationRecord
  belongs_to :pokemon
  belongs_to :evolution, class_name: "Pokemon"
end
