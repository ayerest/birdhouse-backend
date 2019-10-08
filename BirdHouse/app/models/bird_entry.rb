class BirdEntry < ApplicationRecord
  belongs_to :bird
  belongs_to :field_entry
end
