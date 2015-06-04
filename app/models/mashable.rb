require 'httparty'

class Mashable
  include HTTParty
  @@response = HTTParty.get('http://mashable.com/stories.json')
  
  def self.news
    notices_mashable = []
    @@response["new"].each do |notice|
      notices = {}
      notices["title"] = notice['title']
      notices["author"] = notice['author']
      notices["date"] = notice['post_date']
      notices["url"] = notice['link']
      notices["website"] = 'Mashable'
      notices_mashable.push(notices)
    end
    return notices_mashable
  end

  def self.titles
    notices_mashable = []
    @@response["new"].each do |notice|
      title = {}
      title["title"] = notice['title']      
      notices_mashable.push(title)
    end
    return notices_mashable
  end

  def self.authors
    notices_mashable = []
    @@response["new"].each do |notice|
      author = {}
      author["author"] = notice['author']
      notices_mashable.push(author)
    end
    return notices_mashable
  end
end