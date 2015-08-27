class Lddaily < ActiveRecord::Base

def to_s
  "Larry David's quote of the day. no: #{self.id}. #{self.quote} from #{self.source}"

  end
end
