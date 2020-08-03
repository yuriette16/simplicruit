class PositionsController < ApplicationController
  def index
    @positions = policy_scope(Position)
  end
end
