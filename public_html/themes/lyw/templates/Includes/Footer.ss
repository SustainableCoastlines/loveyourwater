<footer id="MainFooter">
	<div id="footer">

		<div class="footer-mask-one">
			<div id="InstaGramMessageHolder">
				<img src="$ThemeDir/img/instagram-icon_s1.png"><span>$SiteConfig.FooterSocialMediaMessage</span>
			</div>
		</div>

		<div id="InstaGramCarouselHolder">
			<div class="customNavigation">
				<a class="btn prev"><img src="$ThemeDir/img/left-arrow.png"></a>
			</div>
			<div class="SmallerFit">
				<div id="owl-demo" class="owl-carousel owl-theme">
					<% control GetInstramPhotos %>
						<div class="item"><img src="$ImageURL"></div>
					<% end_control %>
				</div>
			</div>
			<div class="customNavigation">
				<a class="btn next"><img src="$ThemeDir/img/right-arrow.png"></a>
			</div>
		</div>

		<div id="footer-top">
			<div class="footer-inner">
				<div class="col1">
					<a href="$SiteConfig.FooterFAQLink" class="faq">Frequently asked questions</a>
				</div>
				<div class="col2">
					<div class="connect">
						<% include ConnectMenu %>
						<div class="footer-links">
							<ul>
								<li><a href="about/">About</a></li>
								<li><a href="contact-us/">Contact</a></li>
							</ul>
						</div>
					</div>
					<a class="top" href="#top">Back<br /><span>to top</span></a>
				</div>
			</div>
		</div>
		<div id="footer-bottom">
			<div class="footer-inner">
				<div class="footer-col">
					<h4>$SiteConfig.FooterCol1title</h4>
					$SiteConfig.FooterCol1content
				</div>
				<div class="footer-col">
					<h4>$SiteConfig.FooterCol2title</h4>
					$SiteConfig.FooterCol2content
				</div>
				<div class="footer-col last">
					<h4>$SiteConfig.FooterCol3title</h4>
					$SiteConfig.FooterCol3content
				</div>
				 <div class="col-full-width">
					<p class="left help"><span>Still need a hand? Email <a href="mailto:{$SiteConfig.HelpEmail}">$SiteConfig.HelpEmail</a></span></p>
					<a class="right" href="$BaseHref"><img src="$ThemeDir/img/lyclogo-small.png" /></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</footer>