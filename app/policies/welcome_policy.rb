# frozen_string_literal: true

# Policy for main page
class WelcomePolicy < ApplicationPolicy
  def index?
    true
  end
end

