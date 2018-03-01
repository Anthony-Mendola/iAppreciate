#Associations in the Model

An event has many moments and belongs to a specific user.
A moment also belongs to a specific user.
A User has many events and many moments through events.
A user has a secure password, which is built with bcrypt.


Assessment prep questions:
Request/response flow
Rendering vs. redirecting
Session scope for logging in
The basics of has_secure_password
Migrations and schema.rb
Accessing objects through associations
Bonus!
Understanding model validations
Using before_action macro
