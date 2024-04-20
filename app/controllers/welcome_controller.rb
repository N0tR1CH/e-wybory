# frozen_string_literal: true

# Controller for main pages
class WelcomeController < ApplicationController
  def index
    authorize :welcome, :index?
  end
end
