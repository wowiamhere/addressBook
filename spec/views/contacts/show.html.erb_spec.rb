require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :name => "Name",
      :email => "Email",
      :phone => "",
      :address => "Address",
      :company => "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Company/)
  end
end
