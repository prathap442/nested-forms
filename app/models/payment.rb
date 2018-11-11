class Payment < ApplicationRecord
  state_machine :state,initial: :pending do 
    event :pending do 
      transition pending: :processing
    end
    event :failure do
      transition processing: :failed
    end
    event :success do 
      transition processing: :successful
    end
    event :refund do 
       transition failed:  :refund
    end    
  end
end
