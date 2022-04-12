# -*- coding: utf-8 -*-
#
# version 2.0
# date: 2022/04/13
#
# author: symeon
# email: symeonchen@gmail.com


require 'net/https'
require 'uri'
require 'json'

webhook_url = ENV['webhook_url']

content =  ARGV[0]

uri = URI(webhook_url)

begin
    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
         Net::HTTP.post_form(uri, 'content'=> content)
    end


    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
        puts "记录成功"
    else
        puts "记录失败 - #{res.code}"    
    end
      
rescue => exception
    puts "记录失败 - #{exception}"
end