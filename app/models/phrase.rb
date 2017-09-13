class Phrase < ActiveRecord::Base
    validates :content, presence: true, allow_blank: false, length: {minimum: 5, maximum: 50}
    #minimum and maximum are randomly chosen values
end
