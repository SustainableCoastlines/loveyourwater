$SearchForm
<h1>
$SiteConfig.Title
<% if CurrentMember %>
  <a href="Security/logout/">Logout</a>
<% else %>
  <a href="Security/login">Login</a>
<% end_if %>
</h1>
<p>$SiteConfig.Tagline</p>
