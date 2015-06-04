require 'httparty'

class Mashable
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
    notices_mashable = []
    response = HTTParty.get('http://mashable.com/stories.json')
    response["new"].each do |notice|
      title = notice['title']
      author = notice['author']
      date = notice['post_date']
      url = notice['link']
      website = 'Mashable'
      notice = Mashable.new(author, title, date, url, website)
      notices_mashable.push(notice)
    end
    return notices_mashable
  end

  def self.titles
    notices_mashable = []
    response = HTTParty.get('http://mashable.com/stories.json')
    response["new"].each do |notice|
      title = notice['title']
      author = notice['author']
      date = notice['post_date']
      url = notice['link']
      website = 'Mashable'
      notice = Mashable.new(author, title, date, url, website)
      notices_mashable.push(notice.title)
    end
    return notices_mashable
  end

  def self.authors
    notices_mashable = []
    response = HTTParty.get('http://mashable.com/stories.json')
    response["new"].each do |notice|
      title = notice['title']
      author = notice['author']
      date = notice['post_date']
      url = notice['link']
      website = 'Mashable'
      notice = Mashable.new(author, title, date, url, website)
      notices_mashable.push(notice.author)
    end
    return notices_mashable
  end
end