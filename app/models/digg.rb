require 'httparty'

class Digg
  include HTTParty
  @notices = []  
  @authors = []
  @titles = []
  digg = HTTParty.get('http://digg.com/api/news/popular.json')
  digg["data"]["feed"].each do |notice|
    notices = {}
    authors = {}
    titles = {}
    notices["title"] = notice["content"]['title']
    notices["author"] = notice["content"]['author']
    notices["date"] = Time.at(notice['date'])
    notices["url"] = notice["content"]['url']
    authors["author"] = notice["content"]['author']
    authors["title"] = notice["content"]['title']
    authors["url"] = notice["content"]['url']
    authors["date"] = Time.at(notice['date'])
    titles["title"] = notice["content"]['title']
    titles["author"] = notice["content"]['author']
    titles["url"] = notice["content"]['url']
    titles["date"] = Time.at(notice['date'])
    @notices.push(notices)
    @authors.push(authors)
    @titles.push(titles)
  end

  def self.notices
    @notices
  end

  def self.titles
    @titles
  end

  def self.authors
    @authors
  end
end