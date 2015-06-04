require 'httparty'

class Digg
  include HTTParty
  @@notices = []  
  @@authors = []
  @@titles = []
  digg = HTTParty.get('http://digg.com/api/news/popular.json')
  digg["data"]["feed"].each do |notice|
    notices = {}
    authors = {}
    titles = {}
    notices["title"] = notice["content"]['title']
    notices["author"] = notice["content"]['author']
    notices["date"] = Time.at(notice['date'])
    notices["url"] = notice["content"]['url']
    notices["website"] = 'Digg'
    titles["title"] = notice["content"]['title']
    authors["author"] = notice["content"]['author']
    @@notices.push(notices)
    @@authors.push(authors)
    @@titles.push(titles)
  end

  def self.notices
    @@notices
  end

  def self.titles
    @@titles
  end

  def self.authors
    @@authors
  end
end