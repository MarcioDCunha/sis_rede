require 'net/http'

class FirstController < ApplicationController
#include HTTParty

  def serv_json
    "http://api.dribbble.com/"
  end

  def shots_list(page=0)

    if page==0
      page=1
    end
    
    url = URI.parse("#{serv_json}shots/popular?page=#{page}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
      }
    #print "SHOTS: #{res.body} ===================================\n"
    return res.body
  end

  def index
    
     obj = JSON.parse(shots_list(params[:page]))["shots"]
     @obj = obj
     @obj_length = obj.length

     @page = JSON.parse(shots_list(params[:page]))["page"]
     @pages = JSON.parse(shots_list(params[:page]))["pages"]
     @total = JSON.parse(shots_list(params[:page]))["total"]

    print "==== PAGE: #{@page} ===================================\n"
    
  end

  def show

    url = URI.parse("#{serv_json}shots/#{params[:id]}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
      }
    print "SHOTS: #{res.body} ===================================\n"

    @shot = JSON.parse(res.body)

    @autor = @shot["player"]

  end

end
