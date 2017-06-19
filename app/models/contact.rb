class Contact < ApplicationRecord

  belongs_to :user

  validates :email, uniqueness: { case_sensitive: false, message: "email taken!" }
  validates :name, presence: true

    # - generates csv for user
    # - triggered in views/contact/index 
  def to_csv ops = {}
    
    cols = [ 'id', 'name', 'email', 'phone', 'address', 'company', 'birtday', 'deactivate' ]

    CSV.generate ops do |csv|
      csv << cols
      csv << attributes.values_at(*cols)
    end

  end # to_csv


    # - generates csv for all contacts
    # - link in views/contacts/index
  def self.to_csv ops = {}
    
    cols = [ 'id', 'name', 'email', 'phone', 'address', 'company', 'birtday', 'deactivate' ]

    CSV.generate ops do |csv|
      csv << cols
      
      all.each do |contact|
        csv << contact.attributes.values_at(*cols)
      end

    end

  end # self.to_csv  


end
