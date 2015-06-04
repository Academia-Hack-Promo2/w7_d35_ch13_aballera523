require 'httparty'

class Reddit
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
    notices_reddit = []
    response = HTTParty.get('http://www.reddit.com/.json')
    response["data"]["children"].each do |notice|
      title = notice["data"]['title']
      author = notice["data"]['author']
      date = Time.at(notice["data"]['created'])
      url = notice["data"]['url']
      website = 'Reddit'
      notice = Reddit.new(author, title, date, url, website)
      notices_reddit.push(notice)
    end
    return notices_reddit
  end

  def self.authors
    notices_reddit = []
    response = HTTParty.get('http://www.reddit.com/.json')
    response["data"]["children"].each do |notice|
      title = notice["data"]['title']
      author = notice["data"]['author']
      date = Time.at(notice["data"]['created'])
      url = notice["data"]['url']
      website = 'Reddit'
      notice = Reddit.new(author, title, date, url, website)
      notices_reddit.push(notice.author)
    end
    return notices_reddit
  end

  def self.titles
    notices_reddit = []
    response = HTTParty.get('http://www.reddit.com/.json')
    response["data"]["children"].each do |notice|
      title = notice["data"]['title']
      author = notice["data"]['author']
      date = Time.at(notice["data"]['created'])
      url = notice["data"]['url']
      website = 'Reddit'
      notice = Reddit.new(author, title, date, url, website)
      notices_reddit.push(notice.title)
    end
    return notices_reddit
  end


end
