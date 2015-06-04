class FeedsController < ApplicationController


	def mashable
		render json: Mashable.notices
	end

	def mashable_titles
		render json: Mashable.titles
	end

	def mashable_authors
		render json: Mashable.authors
	end

	def digg
		render json: Digg.notices
	end

	def digg_titles
		render json: Digg.titles
	end

	def digg_authors
		render json: Digg.authors
	end

	def reddit
		render json: Reddit.notices
	end

	def reddit_titles
		render json: Reddit.titles
	end

	def reddit_authors
		render json: Reddit.authors
	end

	def feed
		render json: Feed.notices
	end	

	def feed_authors
		render json: Feed.authors
	end

	def feed_titles
		render json: Feed.titles
	end
end
