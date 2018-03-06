class StaticPagesController < ApplicationController
  def index
    @last_ascents = Ascent.all.last(10)
  end

  def about
  end

  def contact
  end

  def rules
  end

  def thanks
  end
end
