require 'rails_helper'

RSpec.describe "user_groups/index", type: :view do
  before(:each) do
    assign(:user_groups, [
      UserGroup.create!(
        user: nil,
        group: nil
      ),
      UserGroup.create!(
        user: nil,
        group: nil
      )
    ])
  end

  it "renders a list of user_groups" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
