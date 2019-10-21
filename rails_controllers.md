## Rails controllers 

### Background
- **controller**: layer responsible for understanding, processing, and responding to requests. Uses the model layer to fetch ata and the view layer to create the presentation of the response 
- **service object**: plain old Ruby object created for a specific business action. Usually contains code that doesn't fit in either the model or view layer (e.g. actions via a third-party API) 
- Logic that doesn't fit into a controller can go into concerns, config, mailers, jobs, or service objects 
- Params accompany request as `POST` request or query string. Accessible in controller via `params` variable  


- `Model.update_attributes` updates only specific attributes, thus allowing the use of strong params 
    - Beware: bypasses model validations, sending possibly invalid data to the database (emphasizes 
    value of having both model and DB validations)
- `Model.update` updates all attributes, but passes through model validations 
- `helper_method` makes methods defined in `application_controller.rb` available in views 

### Service Objects 
- Helps maintain a design pattern of lean controllers, fat models 
- Encapsulates logic for a single business action 

In it's most explicit form: 
```ruby
# Service object 
class QuoteCreator
  def initialize(data)
    @data = data
  end

  def send_quote
    client = InsuranceCompany::REST::Client.new do |config|
      config.consumer_key         = ENV['CONSUMER_KEY']
      config.consumer_secret      = ENV['CONSUMER_SECRET']
      config.access_token         = ENV['COMPANY_ACCESS_TOKEN']
      config.access_token_secret  = ENV['COMPANY_ACCESS_SECRET']
    end
    client.update(@data)
  end
end

# In the controller...
quote_creator = quoteCreator.new(params[:data])
quote_creator.send_quote
```
Rails will load the service object because it [autoloads](https://guides.rubyonrails.org/autoloading_and_reloading_constants.html) everything under `app/`

Mirroring the semantic pattern of procs allows us to clean up the syntax of the service object. To this end we can use the `Procto` gem, or write our own parent class: 
```ruby
class Application
  def self.call(*args, &block)
    new(*args, &block).call
  end
end

class QuoteCreator < ApplicationService
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    client = InsuranceCompany::REST::Client.new do |config|
      config.consumer_key         = ENV['CONSUMER_KEY']
      config.consumer_secret      = ENV['CONSUMER_SECRET']
      config.access_token         = ENV['COMPANY_ACCESS_TOKEN']
      config.access_token_secret  = ENV['COMPANY_ACCESS_SECRET']
    end
    client.update(@data)
  end
end

# In the controller: 
class QuoteController < ApplicationController
  def create
    QuoteCreator.call(params[:data])
  end
end
```
#### Return options
- Return a value 
- Return a boolean: returning `false` in the case of a failure prevents it from blocking any following controller logic 
- Return an enum. Can be suited for more complex error handling. E.g: 
```ruby
class QuoteRecorder < ApplicationService
  RETURNS = [
    SUCCESS = :success,
    FAILURE = :failure,
    PARTIAL_SUCCESS = :partial_success
  ]

  def call
    meh = do_something
    return SUCCESS if meh.success?
    return FAILURE if meh.failure?
    PARTIAL_SUCCESS
  end

  private

  def do_something
  end
end
```

#### Sources 
- [Set attributes in ActiveRecord - David Verhasselt](https://davidverhasselt.com/set-attributes-in-activerecord/)
- [Rails Service Objects Tutorial - Amin Gilani](https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial#blog_post-article-author)