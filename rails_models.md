## Rails models 

- `serialize` ensures that a column type is an array 
```Ruby 
serialize :recent_messages, Array 
```


#### Sources 
- Rails API `serialize` [documentation](https://api.rubyonrails.org/classes/ActiveRecord/AttributeMethods/Serialization/ClassMethods.html#method-i-serialize)