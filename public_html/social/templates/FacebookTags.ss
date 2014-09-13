
<!-- OPEN GRAPH META TAGS FOR FACEBOOK -->
<meta property="og:site_name" content="$SiteConfig.Title" />
<meta property="og:url" content="{$BaseHref}{$URLSegment}" />
<meta property="fb:admins" content="$SiteConfig.FBAdmin" />
<% if OGType %><meta property="og:type" content="$OGType" /><% else %><meta property="og:type" content="$SiteConfig.OGType" /><% end_if %>
<!-- SET ON PAGE -->
<% if OGTitle %><meta property="og:title" content="$OGTitle" /><% else %><meta property="og:title" content="$MetaTitle" /><% end_if %> 
<% if OGDescription %><meta property="og:description" content="$OGDescription" /><% else %><meta property="og:type" content="$MetaDescription" /><% end_if %> 
<% if OGImage %><meta property="og:image" content="{$OGImage.URL}" /><% else %><meta property="og:image" content="{$SiteConfig.OGImage.URL}" /><% end_if %> 
