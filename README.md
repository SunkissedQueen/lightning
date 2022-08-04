# README

 5285  rails new light_talks -d postgresql -T
 5286  cd light_talks
 5287  git remote add origin https://github.com/SunkissedQueen/lightning.git
 5288  git add .
 5289  gcmsg "initial commit"
 5290  git branch -m "main"
 5291  git push origin main
 5292  git checkout -b read
 5293  code .

Create a database: $ rails db:create
Add the dependencies for RSpec:
$ bundle add rspec-rails
$ rails generate rspec:install
Generate the model with appropriate columns and data types
 5208  rails generate model Topic title:string body:text
$ rails db:migrate
Generate the controller
  5207  rails generate controller Straps index --skip-routes
  $ rails generate controller Home
Begin the rails server: $ rails server
In a browser navigate to: http://localhost:3000

 5209  rails db:migrate

$ rails c
> article = Topic.new(title: "Devise Another Point of View", body: "Upon installing the RubyGem devise, developers will have authentication and authorization at their fingertips. Great functionality but the forms are not that appealing. Today we will briefly introduce ways to customize the forms using bootstrap on the devise views.")               
> article.save

> Topic.create(title: "The Power of Accessibility and Creativity: p5.js", body: "Approaching code can be intimidating as a beginner, especially when you see how fast more experienced web developers approach coding challenges. The uncertainty of handling error messages and not having clarity of how to even start can be crushing to the aspirations of a novice coder. The thoughts can often overshadow the excitement of wanting to learn code and prevent creativity. Fortunately, there are supportive, inclusive resources in this community called meetup groups, mentors, bootcamps, webinars, and open-source libraries. I will show you how I re-connected to my excitement with coding through p5.js.") 

routes
  # Defines the root path route ("/")
  root "straps#index"

  # get "/straps", to: "straps#index"
  # get "/straps/:id", to: "straps#show"
  # Rails provides a routes method named resources that creates seven different routes in your application, all mapping to the controller:
  resources :straps


controller
  def index
    @topics = Topic.all
  end

    def show
    @topic = Topic.find(params[:id])
  end  

view

- Using the resources we can use the helper path for index
<a href="/straps/<%= topic.id %>">  

replace with this line
<a href="<%= strap_path(topic) %>">

-Use link_to replace href
<a href="<%= strap_path(topic) %>">
  <%= topic.title %>
</a>  

replace with this line
<%= link_to topic.title, strap_path(topic) %>

index
<h1>Hello, SD Ruby!!!!</h1>

<h2>The Syntactical Astronaut has been talking to the community.</h2>

<ul>
  <% @topics.each do |topic| %>
    <li>
    <%= link_to topic.title, strap_path(topic) %>
    </li>
  <% end %>
</ul>

show
<h2><%= @topic.title %></h2>

<p><%= @topic.body %></p>


https://human-se.github.io/rails-demos-n-deets-2020/demo-devise-auth/

https://r3id.medium.com/rails-snippet-delete-db-and-app-cb263d878573

https://rubygems.org/


app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
end

gem 'rack-cors', :require => 'rack/cors'
Add a file to the config/initializers directory named cors.rb and add the following code to the new file:
config/initializers/cors.rb

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

$ bundle 

HAD TO REMOVE CORS

app to production, you'll want to change the wildcard * to the URL that your frontend app is served from


Start by downloading the image file using the link above and save it to the project’s app/assets/images folder. All files in the assets directory get compiled by the server and require Rails helper methods to reference the correct file.

Add the image to the page using the image_tag helper method by adding the following code to the top of the welcome.html.erb file:

 <%= image_tag "quiz-bubble.png", height: 300 %>


$ bundle add devise
$ rails generate devise:install
$ rails generate devise User
$ rails db:migrate

config/environments/development.rb

config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

config/initializers/devise.rb

# Find this line:
config.sign_out_via = :delete
# And replace it with this:
config.sign_out_via = :get


$ bundle add bootstrap
$ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
$ yarn add reactstrap
app/assets/stylesheets/application.scss

@import 'bootstrap';

We can use the before_action :authenticate_user! helper from the Devise API in our controllers to require that a user is signed in before they can use the actions we specify.

 5343  gst
 5344  git add .
 5345  gcmsg "added styling and updated application view"
 5346  git push origin mvc-rails
 5347  git add .
 5348  gcmsg "ignore node modules"
 5349  git push origin mvc-rails

 Place node modules in git ignore
 Remove files from the git commit
 5350  git rm -r --cached .
 5351  git add .
 5352  git commit -m "Remove node_modules folder"
 5353  git push origin mvc-rails

 ## Add user name

 - $ rails generate migration add_username_to_user

 class AddUsernameToUser < ActiveRecord::Migration[6.0]
  def change
    # add_column :table, :column_name, :data_type
    add_column :users, :username, :string
  end
end

- $ rails db:migrate

## devise views
- $ rails generate devise:views
```ruby
  # ==> Scopes configuration
  # Turn scoped views on. Before rendering "sessions/new", it will first check for
  # "users/sessions/new". It's turned off by default because it's slower if you
  # are using only default views.


  # This line is commented out and set to false.
  # config.scoped_views = false

  # Update the value to be true:
  config.scoped_views = true
  ```


generate the devise views
  Add form-group to each class field
  class:"form-control" to last line
  <div class="card">
  <div class="card-header">