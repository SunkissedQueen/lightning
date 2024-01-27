***(Still in progress)***  

This comprehensive tutorial is designed for novice and junior developers, aiming to teach the art of customizing a Ruby on Rails application into a full-stack marvel. The tutorial begins by creating a basic application for showcasing a list of presentations. Devise, a versatile authentication solution, plays a pivotal role, enhancing user management and security. To ensure a polished and user-friendly interface, Devise forms are thoughtfully styled using Bootstrap, offering a seamless and visually appealing experience for both developers and end-users alike.  

![Landing page](/app/assets/images/landing.png)


* [Description](#description)
* [Acknowledgements](#acknowledgements)
* [Project Status](#project-status)
* [Setup](#create-rails-app)
* [Devise](#adding-devise)
* [Bootstrap](#bootstrap)
* [Room for Improvement](#room-for-improvement)
* [Troubleshooting](#troubleshooting)

## Description
In its current state, this app demonstrates how to customize devise forms with bootstrap. Devise is a resourceful Ruby Gem that helps with authentication and authorization. It comes prepackaged with various modules:
- Database Authenticatable: This encrypts and stores a password to the database to validate the authenticity of a user while signing in.
- Omniauthable: This attaches OmniAuth support to Devise. Users of your application will be able to sign in using accounts such as Facebook, Twitter, and Google.
- Confirmable: This enables the sending of emails with instructions that will help in the verification of an account.
- Recoverable: This module helps in times when users forget their password and need to recover it. With this, the user will be able to reset the password.
- Registerable: This handles the signup of users. It also allows users to edit and delete their accounts.
### Default signup page
![Current devise log in](/app/assets/images/log_in.png)
- Rememberable: This module makes it possible for your application to remember a logged-in user by storing a cookie.
- Trackable: This module helps track sign-in count, timestamps, and IP address.
- Timeoutable: This module is responsible for expiring a session that has not been active for a period of time.
- Validatable: With this module, email and password get to be validated.
- Lockable: This provides an extra layer of security—when activated, an account can be locked after a given number of failed sign-in attempts.  
With many template, the styling tends to lack luster. That is actually the beauty of this software, you can customize it with the help of terminal commands and modifying the appropriate files. 
![Custom page](/app/assets/images/custom.png)

## Acknowledgements
[LEARN modifying devise](https://github.com/learn-academy-2022-echo/Syllabus/blob/main/capstone/modifying-devise.md)

[Rails tutorial](https://human-se.github.io/rails-demos-n-deets-2020/demo-devise-auth/)

[Deleting a Rails App](https://r3id.medium.com/rails-snippet-delete-db-and-app-cb263d878573)

[RubyGems](https://rubygems.org/)

[Exploring Devise](https://code.tutsplus.com/tutorials/exploring-devise-part-1--cms-26587)

[Astronaut Drawing](https://www.craiyon.com/)

## Project Status
- Initially this project was created to showcase styling with devise and bootstrap. As with any web development, creativity brought forth an idea to display my recent tech talks. 
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
