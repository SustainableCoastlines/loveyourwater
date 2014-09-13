<section class="Social">
	<div id="page-share">
		<% if InSection(my-events) %>
		<% else %>
		<% include FacebookLikeContent %>
		<% include TweetPage %>
		<% include GooglePlusOne %>
		<% end_if %>
		<div id="google_translate_element"></div>
	</div>
</section>