require 'httparty'

class Reddit
  include HTTParty
  @@response = HTTParty.get('http://www.reddit.com/.json')

  def self.news
    notices_reddit = []    
    @@response["data"]["children"].each do |notice|
      notices = {}
      notices["title"] = notice["data"]['title']
      notices["author"] = notice["data"]['author']
      notices["date"] = Time.at(notice["data"]['created'])
      notices["url"] = notice["data"]['url']
      notices["website"] = 'Reddit'
      notices_reddit.push(notices)
    end
    return notices_reddit
  end

  def self.authors
    notices_reddit = []
    @@response["data"]["children"].each do |notice|
      author = {}
      author["author"] = notice["data"]['author']
      notices_reddit.push(author)
    end
    return notices_reddit
  end

  def self.titles
    notices_reddit = []
    @@response["data"]["children"].each do |notice|
      title = {}
      title["title"] = notice["data"]['title']
      notices_reddit.push(title)
    end
    return notices_reddit
  end
end
