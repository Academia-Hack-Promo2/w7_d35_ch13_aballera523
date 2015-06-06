require 'httparty'

class Feed
  include HTTParty
  @mashable = HTTParty.get('http://mashable.com/stories.json')
  @reddit = HTTParty.get('http://www.reddit.com/.json')
  @digg = HTTParty.get('http://digg.com/api/news/popular.json')
  @notices = []  
  @authors = []
  @titles = []  
    
  @mashable["new"].each do |notice|
    notices = {}
    authors = {}
    titles = {}
    notices["author"] = notice['author']
    notices["title"] = notice['title']
    notices["date"] = notice['post_date']
    notices["url"] = notice['link']
    notices["website"] = 'Mashable'
    authors["author"] = notice['author']
    authors["title"] = notice['title']    
    authors["url"] = notice['link']
    titles["title"] = notice['title']    
    titles["author"] = notice['author']
    titles["url"] = notice['link']
    @notices.push(notices)
    @authors.push(authors)
    @titles.push(titles)
  end    
    
  @reddit["data"]["children"].each do |notice|
    notices = {}
    authors = {}
    titles = {}
    notices["author"] = notice["data"]['author']
    notices["title"] = notice["data"]['title']
    notices["date"] = Time.at(notice["data"]['created'])
    notices["url"] = notice["data"]['url']
    notices["website"] = 'Reddit'
    authors["author"] = notice["data"]['author']
    authors["title"] = notice["data"]['title']    
    authors["url"] = notice["data"]['url']
    titles["title"] = notice["data"]['title']
    titles["author"] = notice["data"]['author']        
    titles["url"] = notice["data"]['url']
    @notices.push(notices)
    @authors.push(authors)
    @titles.push(titles)
  end    
    
  @digg["data"]["feed"].each do |notice|
    notices = {}
    authors = {}
    titles = {}
    notices["author"] = notice["content"]['author']
    notices["title"] = notice["content"]['title']
    notices["date"] = Time.at(notice['date'])
    notices["url"] = notice["content"]['url']
    notices["website"] = 'Digg'
    authors["author"] = notice["content"]['author']    
    authors["title"] = notice["content"]['title']    
    authors["url"] = notice["content"]['url']
    titles["title"] = notice["content"]['title']
    titles["author"] = notice["content"]['author'] 
    titles["url"] = notice["content"]['url']
    @notices.push(notices)
    @authors.push(authors)
    @titles.push(titles)
  end

  def self.notices
    @notices
  end  

  def self.authors
    @authors
  end   

  def self.titles
    @titles
  end 
end
