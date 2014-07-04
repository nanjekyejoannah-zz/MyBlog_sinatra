
require 'rubygems'
require 'sinatra'
require 'active_record'

configure :production do

db = URI.parse('postgres://user:pass@localhost/dbname')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

end

configure :development do
  ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database =>  'MySite.sqlite3.db'
  )
end


class Post < ActiveRecord::Base
	has_many :comments
end
class  Comment < ActiveRecord::Base
	belongs_to :post
end

get '/' do
	@title = "blog"
	@posts = Post.all()
	erb :home
  
end

get '/about' do
	erb :about
  
end

get '/contact' do

	erb :contact
  
end
get '/app' do

  erb :app
  
end

get '/admin' do
   @post = Post.new
   erb :admin
 end
 
post '/admin' do
   @post = Post.new(params[:post])
   if @post.save
     redirect "/admin"
   else
     "There was a problem saving that..."
   end
 end

 

 