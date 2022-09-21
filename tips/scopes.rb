# Scoping allows you to specify commonly-used queries which can be referenced as method calls on the association objects or models. With these scopes, you can use every method previously covered such as `where`, `joins` and `includes`. All scope bodies should return an `ActiveRecord::Relation` or `nil` to allow for further methods (such as other scopes) to be called on it.

# To define a simple scope, we use the [scope](https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/Scoping/Named/ClassMethods.html#method-i-scope) method inside the class, passing the query that we'd like to run when this scope is called:

class Book < ApplicationRecord
  scope :out_of_print, -> { where(out_of_print: true) }
end

# We can call this scope like this, which will return a ActiveRecord::Relation object
Book.out_of_print

# Or on an association consisting of Book objects
author = Author.first
author.books.out_of_print

# Scopes are also chainable
class Book < ApplicationRecord
  scope :out_of_print, -> { where(out_of_print: true) }
  scope :out_of_print_and_expensive, -> { where(out_of_print.where("price > 500")) }
end
