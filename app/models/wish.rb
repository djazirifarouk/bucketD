class Wish < ApplicationRecord
    belongs_to :user
    after_initialize :set_defaults
    
    # INITIALIZING
    def set_defaults
        self.budget_achieved ||= 0
        self.nb_likes ||= 0
        self.nb_contributors ||= 0
    end

end
