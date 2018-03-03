#Associations in the Model

An event has many moments and belongs to a specific user.
A moment also belongs to a specific user.
A User has many events and many moments through events.
A user has a secure password, which is built with bcrypt.

------Study Notes------
Assessment prep questions:
1 Request/response flow
2 Rendering vs. redirecting
3 Session scope for logging in
4 The basics of has_secure_password
5 Migrations and schema.rb
6 Accessing objects through associations

Bonus!
7 Understanding model validations
8 Using before_action macro


1)

2)






3)
User visits the login page and fills out a form with their email and password. They hit 'submit' to POST that data to a controller route.
That controller route accesses the user's email and password from the params hash. That info is used to find the appropriate user from the database with a line such as User.find_by(email: params[:email], password: params[:password]). Then, that user's ID is stored as the value of session[:id]

4) has_secure_password works in conjunction with bcrypt and gives us the ability to store passwords in a secure way in the database.


5)


6)




7)
The code in app/models/user.rb validates some of the attributes of our user by writing code that makes sure no one can sign up without inputting their name, email, and password.

8)
Filters are methods that are run "before", "after" or "around" a controller action.

Filters are inherited, so if you set a filter on ApplicationController, it will be run on every controller in your application.

"before" filters may halt the request cycle. A common "before" filter is one which requires that a user is logged in for an action to be run. You can define the filter method this way:
class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end

---------
Ensure that we have a different model for every class we build, that we only have one erb file per view, etc. A model handles our Ruby logic, our controllers handle the HTTP requests and connect to our models, and our views either take in or display data to our users.
Minimize the amount of logic our views contain. Our views should never directly pull from the database  (ie. User.all, etc). All of that should be taken care of in the controller actions, and the data should be passed to the view via a specific controller action.
-----------------
