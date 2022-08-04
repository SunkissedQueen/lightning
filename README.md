Thank you for viewing my application. This is a collection of my recent tech talks. In order to view more details about each topic, you will need to sign-up or log-in.
![Landing page](/app/assets/images/landing.png)


* [Acknowledgements](#acknowledgements)
* [Project Status](#project-status)
* [Setup](#create-rails-app)
* [Devise](#adding-devise)
* [Bootstrap](#bootstrap)
* [Room for Improvement](#room-for-improvement)
* [Troubleshooting](#troubleshooting)

## Acknowledgements
[LEARN modifying devise](https://github.com/learn-academy-2022-echo/Syllabus/blob/main/capstone/modifying-devise.md)

[Rails tutorial](https://human-se.github.io/rails-demos-n-deets-2020/demo-devise-auth/)

[Deleting a Rails App](https://r3id.medium.com/rails-snippet-delete-db-and-app-cb263d878573)

[RubyGems](https://rubygems.org/)

[Astronaut Drawing](https://www.craiyon.com/)

## Project Status
- Currently this application showcases how to customize devise forms.
- Still in progress. Plan to add videos for each topic, animation on navigation bar, and test coverage. Ongoing improvements in code base.

## Create rails app
- $ rails new light_talks -d postgresql -T
- $ cd light_talks
- $ git remote add origin https://github.com/SunkissedQueen/lightning.git
- $ git add .
- $ gcmsg "initial commit"
- $ git branch -m "main"
- $ git push origin main
- $ git checkout -b read
- $ code .

### Database and dependencies
- Create a database: $ rails db:create
- Add the dependencies for RSpec: $ bundle add rspec-rails
- $ rails generate rspec:install
- Generate the model with appropriate columns and data types: $ rails generate model Topic title:string body:text
- $ rails db:migrate
- Generate the controller: $ rails generate controller Straps index --skip-routes
- Begin the rails server: $ rails server
- In a browser navigate to: http://localhost:3000

### Add data entries
- $ rails c  
> article = Topic.new(title: "Devise Another Point of View", body: "Upon installing the RubyGem devise, developers will have authentication and authorization at their fingertips. Great functionality but the forms are not that appealing. Today we will briefly introduce ways to customize the forms using bootstrap on the devise views.")  
> article.save  
> Topic.create(title: "The Power of Accessibility and Creativity: p5.js", body: "Approaching code can be intimidating as a beginner, especially when you see how fast more experienced web developers approach coding challenges. The uncertainty of handling error messages and not having clarity of how to even start can be crushing to the aspirations of a novice coder. The thoughts can often overshadow the excitement of wanting to learn code and prevent creativity. Fortunately, there are supportive, inclusive resources in this community called meetup groups, mentors, bootcamps, webinars, and open-source libraries. I will show you how I re-connected to my excitement with coding through p5.js.") 

### Setup routes, controllers, views
```ruby
  # routes
  # Defines the root path route ("/")
  root "straps#index"

  # get "/straps", to: "straps#index"
  # get "/straps/:id", to: "straps#show"
  # Rails provides a routes method named resources that creates seven different routes in your application, all mapping to the controller:
  resources :straps

  # controllers
  def index
    @topics = Topic.all
  end

    def show
    @topic = Topic.find(params[:id])
  end  

  # views
  # Using the resources we can use the helper path for index
  # preparing index page to display multiple entries from db
  <ul>
    <% @topics.each do |topic| %>
      <li>
        <%= link_to topic.title, strap_path(topic) %>
      </li>
    <% end %>
  </ul>

  # preparing show page
  <h2><%= @topic.title %></h2>

  <p><%= @topic.body %></p>
```

### skip token
- Add the following in app/controllers/application_controller.rb
```ruby
  skip_before_action :verify_authenticity_token
```

### images
- Save image to the project’s app/assets/images folder. - Add the image to the page using the image_tag helper method:
```ruby
 <%= image_tag "image-name.png", height: 300 %>
```

## bootstrap
- $ bundle add bootstrap
- $ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
- $ yarn add reactstrap
- Add the following to app/assets/stylesheets/application.scss
```ruby
@import 'bootstrap';
# To combat errors after importing bootstrap, I import the links on the layouts/application.html.erb
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
```

## adding devise
- $ bundle add devise
- $ rails generate devise:install
- $ rails generate devise User
- $ rails db:migrate
```ruby
# Add the following to config/environments/development.rb:
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

# Modify the config/initializers/devise.rb
# Find this line:
config.sign_out_via = :delete
# And replace it with this:
config.sign_out_via = :get

# We can use the before_action :authenticate_user! helper from the Devise API in our controllers to require that a user is signed in before they can see the show page
  before_action :authenticate_user!, only: [:show]
```

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

## Default forms with devise
![Current devise log in](/app/assets/images/log_in.png)
![Current devise sign up](/app/assets/images/sign_up.png)
!()

## Modifying devise views
  - Add form-group to each class field
  - class:"form-control" to last line
  - class="card" and class="card-header" attributes for a smoother layout

## Troubleshooting
### Place node modules in git ignore
- Remove files from the git commit
  - $ git rm -r --cached .
  - $ git add .
  - $ git commit -m "Remove node_modules folder"
  - $ git push origin mvc-rails

## Room for Improvement
 ### Add user name
  - $ rails generate migration add_username_to_user
  ```ruby
    def change
      # add_column :table, :column_name, :data_type
      add_column :users, :username, :string
    end
  ```
  - $ rails db:migrate
  ### Adding devise-bootstrap-views
  ### Debugging