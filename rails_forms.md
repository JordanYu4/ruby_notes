## Rails forms 

- Using square brakcets after a collection name allows you to pass the collection to the controller as an array 
    - Use case: `has_many` relationships 
```Ruby
<%= hidden_field_tag 'role[permissions][]', [] %>

<ul>
  <% @roles.each do |role| %>
      <li>
        <%= check_box_tag 'role_ids[]', role.id -%>
        <%= h role.name -%>
      </li>
  <% end %>
</ul>
``` 
Using this would send a param within `role` that looks like `"role_ids"=>["1", "2", "3"]`  