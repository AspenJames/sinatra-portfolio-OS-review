# Sinatra Portfolio Project

## Operating System Review Website

### A simple website for reviewing and viewing reviews of operating systems.

## Requirements

1. Build an MVC Sinatra Application.
2. Use ActiveRecord with Sinatra.
3. Use Multiple Models.
4. Use at least one `has_many` relationship on a User model and one `belongs_to` relationship on another model
5. Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
6. Must have the abilty to create, read, update and destroy any instance of the resource that belongs to a user.
7. Ensure that any instance of the resource that belongs to a user can be edited or deleted only by that user.
8. You should also have validations for user input to ensure that bad data isn't added to the database. The fields in your signup form should be required and the user attribute that is used to login a user should be a unique value in the DB before creating the user.

## Overview

This project will be an interactive website where users can log in to review operating systems. Content will be specific to and dependent upon users being properly logged in to an account.

## Structure

* This project will have three models initially with the following associations:
  - User: has many Reviews and has many Operating Systems through Reviews.
  - Review: belongs to a User and belongs to an Operating System.
  - Operating System: has many Reviews and has many Users through Reviews.
* Each model will have its own controller, as well as a general Applicaiton Controller.
* Content will be specific to and dependent upon a User being properly logged in.
