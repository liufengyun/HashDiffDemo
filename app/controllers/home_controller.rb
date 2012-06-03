class HomeController < ApplicationController
  caches_page :index

  def index
    @json1 = File.read(Rails.root.join("data", "menu1.json"))
    @json2 = File.read(Rails.root.join("data", "menu2.json"))

    @yaml1 = File.read(Rails.root.join("data", "product1.yml"))
    @yaml2 = File.read(Rails.root.join("data", "product2.yml"))
  end
end
