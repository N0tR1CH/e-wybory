require 'rails_helper'

RSpec.describe "user_groups/edit", type: :view do
  let(:user_group) {
    UserGroup.create!(
      user: nil,
      group: nil
    )
  }

  before(:each) do
    assign(:user_group, user_group)
  end

  it "renders the edit user_group form" do
    render

    assert_select "form[action=?][method=?]", user_group_path(user_group), "post" do

      assert_select "input[name=?]", "user_group[user_id]"

      assert_select "input[name=?]", "user_group[group_id]"
    end
  end
end
