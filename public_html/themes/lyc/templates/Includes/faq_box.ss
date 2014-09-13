<div id="faq-box-container">
    <div id="faq-box-title"><h1>FAQ'S</h1></div><div id="faq-box-subtitle">Click on questions to show answers</div>
    <div class="clear"></div>
    <ul id="faqs">
        <% control Faqs %>
        <li>
            <a href="#">$Question</a>
            <ul>
                <li>$Answer</li>
            </ul>
        </li>
        <% end_control %>
    </ul>
</div>