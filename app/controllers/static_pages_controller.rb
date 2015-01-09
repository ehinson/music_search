

class StaticPagesController < ApplicationController

require 'open-uri'

require 'json'

include StaticPagesHelper

  def index
    @search = params[:search]
    @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)

  end

  def results
    @search = params[:search]
    @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)

  end

  def search(search, results)
    if results.include? search
      return results[search]
    else
      print "hi"
      
    end
  end

  
end
