<% if flash[:notice] %>
  <p><%= flash[:notice] %></p>
<% end %>

<% if flash[:error] %>
  <% flash[:error].each do |error| %>
    <p><%= error %></p>
  <% end %>
<% end %>