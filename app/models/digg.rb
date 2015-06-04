require 'httparty'

class Digg
  include HTTParty
  attr_accessor :author, :title, :date, :url, :website

  def initialize author, title, date, url, website
    @author = author
    @title = title
    @date = date
    @url = url
    @website = website
  end  

  def self.news
    notices_digg = []
    response = HTTParty.get('http://digg.com/api/news/popular.json')
    response["data"]["feed"].each do |notice|
      title = notice["content"]['title']
      author = notice["content"]['author']
      date = Time.at(notice['date'])
      url = notice["content"]['url']
      website = 'Digg'
      notice = Digg.new(author, title, date, url, website)
      notices_digg.push(notice)
    end
    return notices_digg
  end

  def self.titles
    notices_digg = []
    response = HTTParty.get('http://digg.com/api/news/popular.json')
    response["data"]["feed"].each do |notice|
      title = notice["content"]['title']
      author = notice["content"]['author']
      date = Time.at(notice['date'])
      url = notice["content"]['url']
      website = 'Digg'
      notice = Digg.new(author, title, date, url, website)
      notices_digg.push(notice.title)
    end
    return notices_digg
  end

  def self.authors
    notices_digg = []
    response = HTTParty.get('http://digg.com/api/news/popular.json')
    response["data"]["feed"].each do |notice|
      title = notice["content"]['title']
      author = notice["content"]['author']
      date = Time.at(notice['date'])
      url = notice["content"]['url']
      website = 'Digg'
      notice = Digg.new(author, title, date, url, website)
      notices_digg.push(notice.author)
    end
    return notices_digg
  end
end