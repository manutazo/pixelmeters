class Pixel < ApplicationRecord
 belongs_to :track
 validates_presence_of :ip_address
end
