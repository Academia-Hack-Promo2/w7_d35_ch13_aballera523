require 'httparty'

class Mashable
  include HTTParty
  @notices = []  
  @titles = []
  @authors = [] 
  mashable = HTTParty.get('http://mashable.com/stories.json')
  mashable["new"].each do |notice|
    notices = {}
    authors = {}
    titles = {} 
    notices["title"] = notice['title']
    notices["author"] = notice['author']
    notices["date"] = notice['post_date']
    notices["url"] = notice['link']
    notices["website"] = 'Mashable'
    authors["author"] = notice['author']
    authors["title"] = notice['title']
    authors["url"] = notice['link']
    authors["date"] = notice['post_date']
    titles["title"] = notice['title']
    titles["author"] = notice['author']
    titles["url"] = notice['link']
    titles["date"] = notice['post_date']
    @notices.push(notices)
    @titles.push(titles)    
    @authors.push(authors)     
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