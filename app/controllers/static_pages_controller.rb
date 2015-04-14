class StaticPagesController < ApplicationController

  # before_action :require_logged_in, only: [:root]

  def root
    if signed_in?
      render :root
    else
      render :splash
    end
  end
end
