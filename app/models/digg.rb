require 'httparty'

class Digg
  include HTTParty
  @@response = HTTParty.get('http://digg.com/api/news/popular.json')

  def self.news
    notices_digg = []    
    @@response["data"]["feed"].each do |notice|
      notices = {}
      notices["title"] = notice["content"]['title']
      notices["author"] = notice["content"]['author']
      notices["date"] = Time.at(notice['date'])
      notices["url"] = notice["content"]['url']
      notices["website"] = 'Digg'
      notices_digg.push(notices)
    end
    return notices_digg
  end

  def self.titles
    notices_digg = []
    @@response["data"]["feed"].each do |notice|
      title = {}
      title["title"] = notice["content"]['title']
      notices_digg.push(title)
    end
    return notices_digg
  end

  def self.authors
    notices_digg = []
    @@response["data"]["feed"].each do |notice|
      author = {}
      author["author"] = notice["content"]['author']
      notices_digg.push(author)
    end
    return notices_digg
  end
end