## Rails controllers 

- `Model.update_attributes` updates only specific attributes, thus allowing the use of strong params 
    - Beware: bypasses model validations, sending possibly invalid data to the database (emphasizes 
    value of having both model and DB validations)
- `Model.update`updates all attributes, but passes through model validations 

#### Sources 
- [Set attributes in ActiveRecord - David Verhasselt](https://davidverhasselt.com/set-attributes-in-activerecord/)