class PagesController < ApplicationController
  def show
    page = params[:page] || "home"
    render template: "pages/#{page}"
  end
end
