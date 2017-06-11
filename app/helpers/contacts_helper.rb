module ContactsHelper

    # - to calculate age
    # - used in app/views/contacts/index
  def get_age(some_date)

    now = Date.today
    bday_this_year = Date.new now.year, some_date.month, some_date.day

    now.year - some_date.year - ( bday_this_year > now ? 1 : 0 )

  end

end
