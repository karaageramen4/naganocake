class OrderProduct < ApplicationRecord

  belongs_to :order
  belongs_to :products

   enum produciton_status: {"着手不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3}


   def subtotal
    price * amount
   end

end
