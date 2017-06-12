require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe "------->Contact MODEL authentication<-------\n" do 

    it "----->should NOT save if email NOT unique" do 
      @contact_1 = create :contact
      @contact_2 = build :contact
      @contact_2.email = @contact_1.email

      expect{ @contact_2.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it "---->should NOT save if name NOT present" do 
      @contact_1 = build :contact
      @contact_1.name = nil

      expect{ @contact_1.save! }.to raise_error ActiveRecord::RecordInvalid
    end

    it "---->should NOT save if NOT ASSOCIATED to a user" do 
      @contact_1 = build :contact
      @contact_1.user_id = nil

      expect{ @contact_1.save! }.to raise_error ActiveRecord::RecordInvalid
    end

  end


end
