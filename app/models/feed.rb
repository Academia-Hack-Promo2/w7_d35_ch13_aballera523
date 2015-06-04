require 'httparty'

class Feed
  include HTTParty
  @@mashable = HTTParty.get('http://mashable.com/stories.json')
  @@reddit = HTTParty.get('http://www.reddit.com/.json')
  @@digg = HTTParty.get('http://digg.com/api/news/popular.json')

  def self.news
    all_notice = []    
    @@mashable["new"].each do |notice|
      notices = {}
      notices["author"] = notice['author']
      notices["title"] = notice['title']
      notices["date"] = notice['post_date']
      notices["url"] = notice['link']
      notices["website"] = 'Mashable'
      all_notice.push(notices)
    end    
    
    @@reddit["data"]["children"].each do |notice|
      notices = {}
      notices["author"] = notice["data"]['author']
      notices["title"] = notice["data"]['title']
      notices["date"] = Time.at(notice["data"]['created'])
      notices["url"] = notice["data"]['url']
      notices["website"] = 'Reddit'
      all_notice.push(notices)
    end    
    
    @@digg["data"]["feed"].each do |notice|
      notices = {}
      notices["author"] = notice["content"]['author']
      notices["title"] = notice["content"]['title']
      notices["date"] = Time.at(notice['date'])
      notices["url"] = notice["content"]['url']
      notices["website"] = 'Digg'
      all_notice.push(notices)
    end
    return all_notice
  end  

  def self.authors
    all_notice = []
    @@mashable["new"].each do |notice|
      author = {}
      author["author"] = notice['author']
      all_notice.push(author)
    end    
    
    @@reddit["data"]["children"].each do |notice|
      author = {}
      author["author"] = notice["data"]['author']
      all_notice.push(author)
    end    
   
    @@digg["data"]["feed"].each do |notice|
      author = {}
      author["author"] = notice["content"]['author']
      all_notice.push(author)
    end
    return all_notice
  end   

  def self.titles
    all_notice = []
    
    @@mashable["new"].each do |notice|
      title = {}
      title["title"] = notice['title']
      all_notice.push(title)
    end    
    
    @@reddit["data"]["children"].each do |notice|
      title = {}
      title["title"] = notice["data"]['title']
      all_notice.push(title)
    end
        
    @@digg["data"]["feed"].each do |notice|
      title = {}
      title["title"] = notice["content"]['title']
      all_notice.push(title)
    end
    return all_notice
  end 
end
