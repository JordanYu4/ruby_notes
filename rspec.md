## `rspec` 

- methods silently ignore unexpected blocks 
- `instance_eval` 
    - takes a proc (convert block w/ pretzel) 
    - when used in instance method, runs accepted proc as if method on parent class (provides scope to other instance methods) 
    - core of most DSLs in Ruby 
- `assert_raise(error)` takes in block that expects the given `error` 
- `rspec` almost “naturally falls out” of Ruby’s block syntax 