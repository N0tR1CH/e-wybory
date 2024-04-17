# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    redis = Redis.new(host: 'redis', port: 6379)
    redis.incr 'page hits'
    @page_hits = redis.get 'page hits'
  end

  # GET
  def testparameter
    render :json => :id
  end

  def testparameter2
    render :json => :id
  end
end
