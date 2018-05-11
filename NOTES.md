# Operating System Review Project

## Models

* Users:
  - Name
  - Username
  - Email
  - Password (digest - bcrypt gem)
  - `has_many :reviews`
  - `has_many :operating_systems, through: :reviews`
  - Slugifiable

* Reviews:
  - Content
  - user_id
  - operating_system_id
  - `belongs_to :user`
  - `belongs_to :operating_system`

* Operating Systems:
  - Name
  - Type (Windows, Mac, Linux, BSD, etc.)
  - Desktop Screenshot (optional)
  - `has_many :reviews`
  - `has_many :users, through: :reviews`
  - Slugifiable

## Controllers

* Application Controller:
  - Index (logged out):
    + Welcome screen, info summary
    + Login/signup links
  - Index (logged in):
    + Welcome screen
    + Create new review link
    + Log out link
  - Signup/login/logout routes

* User Controller:
  - Index (logged in only):
    + List of Users (links)
  - Show (slug)
    + List of User's reviewed OSs
  - New only by signup

* Review Controller:
  - Index (logged in only):
    + List of Reviews (links)
  - Show (id)
    + Individual review info, links to User + OS
  - New/edit/delete

* Operating System Controller:
  - Index (logged in only):
    + List of OSs (links)
  - Show (slug):
    + List of reviews w/ links
  - New only by review form

## Specifications

  - Users cannot view reviews or OSs unless logged in
  - Users can only edit/delte their own reviews
  - Users cannot delete an OS option once created
  - Users can only create new OS option in review forms (new + edit)
  - Users can choose from a list of OSs or create new
  - Flash messages used to deliver "error messages"
  - Users can log out from any view
  - Routes, redirects, and renders follow RESTful convention

## Stretch Goals

* Links to OS homepage, scrape detail on install instructions?
