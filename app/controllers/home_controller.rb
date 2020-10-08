class HomeController < ApplicationController
	def about
		@book=Book.new
		@user=User.new
	end

	def top
		@book=Book.new
		@user=User.new
	end
end
