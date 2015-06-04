require 'httparty'

class Feed
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
    all_notice = []
    response = HTTParty.get('http://mashable.com/stories.json')
    response["new"].each do |notice|
      author = notice['author']
      title = notice['title']
      date = notice['post_date']
      url = notice['link']
      website = 'Mashable'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice)
    end
    
    response = HTTParty.get('http://www.reddit.com/.json')
    response["data"]["children"].each do |notice|
      author = notice["data"]['author']
      title = notice["data"]['title']
      date = Time.at(notice["data"]['created'])
      url = notice["data"]['url']
      website = 'Reddit'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice)
    end
    
    response = HTTParty.get('http://digg.com/api/news/popular.json')
    response["data"]["feed"].each do |notice|
      author = notice["content"]['author']
      title = notice["content"]['title']
      date = Time.at(notice['date'])
      url = notice["content"]['url']
      website = 'Digg'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice)
    end
    return all_notice
  end  

  def self.authors
    all_notice = []
    response = HTTParty.get('http://mashable.com/stories.json')
    response["new"].each do |notice|
      author = notice['author']
      title = notice['title']
      date = notice['post_date']
      url = notice['link']
      website = 'Mashable'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice.author)
    end
    
    response = HTTParty.get('http://www.reddit.com/.json')
    response["data"]["children"].each do |notice|
      author = notice["data"]['author']
      title = notice["data"]['title']
      date = Time.at(notice["data"]['created'])
      url = notice["data"]['url']
      website = 'Reddit'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice.author)
    end
    
    response = HTTParty.get('http://digg.com/api/news/popular.json')
    response["data"]["feed"].each do |notice|
      author = notice["content"]['author']
      title = notice["content"]['title']
      date = Time.at(notice['date'])
      url = notice["content"]['url']
      website = 'Digg'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice.author)
    end
    return all_notice
  end   

  def self.titles
    all_notice = []
    response = HTTParty.get('http://mashable.com/stories.json')
    response["new"].each do |notice|
      author = notice['author']
      title = notice['title']
      date = notice['post_date']
      url = notice['link']
      website = 'Mashable'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice.title)
    end
    
    response = HTTParty.get('http://www.reddit.com/.json')
    response["data"]["children"].each do |notice|
      author = notice["data"]['author']
      title = notice["data"]['title']
      date = Time.at(notice["data"]['created'])
      url = notice["data"]['url']
      website = 'Reddit'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice.title)
    end
    
    response = HTTParty.get('http://digg.com/api/news/popular.json')
    response["data"]["feed"].each do |notice|
      author = notice["content"]['author']
      title = notice["content"]['title']
      date = Time.at(notice['date'])
      url = notice["content"]['url']
      website = 'Digg'
      notice = Feed.new(author, title, date, url, website)
      all_notice.push(notice.title)
    end
    return all_notice
  end 
end
