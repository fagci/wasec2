#!/usr/bin/env ruby

require 'uri'
require 'net/http'
require 'yaml'

class String
  def match_dict(dict)
    words = File.open("./data/#{dict}.txt").map(&:chomp)
    re = Regexp.union words
    scan(re).uniq
  end

  def match_regexps(reg_hash)
    reg_hash.map do |name, re|
      [name, scan(re).uniq]
    end.to_h
  end
end

class WASec
  def initialize(url)
    @uri = URI url
  end

  def techs
    @body.match_dict 'techs'
  end

  def cms
    @body.match_dict 'cms'
  end

  def contacts
    require './data/regexps'
    @body.match_regexps CONTACTS
  end

  def analytics
    require './data/regexps'
    @body.match_regexps ANALYTICS
  end

  def check_body(checks = %w[techs cms contacts analytics])
    checks.each do |c|
      result = send(c)
      next if result.empty?

      case result
      when Hash
        items = result.filter_map{ |k, v| "- #{k}: #{v.join(', ')}" unless v.empty? }.join("\n")
        puts "#{c}:\n#{items}" unless items.empty?
      when Array
        puts "#{c}: #{result.join(', ')}"
      end
    end
  end

  def check
    @response = Net::HTTP.get_response @uri
    @header, @body = @response.header, @response.body

    check_body
  end
end

wasec = WASec.new 'https://hackthissite.org'
wasec.check
