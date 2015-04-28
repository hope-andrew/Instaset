class StaticPagesController < ApplicationController
  def root
    if signed_in?
      render :root
    else
      render :splash2
    end
  end
end
