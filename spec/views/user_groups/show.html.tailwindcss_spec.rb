require 'rails_helper'

RSpec.describe "user_groups/show", type: :view do
  before(:each) do
    assign(:user_group, UserGroup.create!(
      user: nil,
      group: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
