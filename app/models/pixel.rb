class Pixel < ApplicationRecord
  belongs_to :tracks
 validates_presence_of :ip_address
end
