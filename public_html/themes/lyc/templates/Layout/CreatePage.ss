<div class="columns">
    <div class="left-column">
        <% if CurrentMember %>
        <div class="form-left">
            <div class="form-cloud-background">
                <div class="form-cloud-top">
                    <div class="form-cloud-bottom">
                        <div class="form-cloud-contents">
                            $JoinMessage
                            $CreateForm
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% else %>
        
        <h1>Login</h1>
        <div class="form-left">
            <div class="form-cloud-background">
                <div class="form-cloud-top">
                    <div class="form-cloud-bottom">
                        <div class="form-cloud-contents">
                            <% control page(my-events) %>
                            $LoginMessage
                            <% end_control %>
                            $LoginForm
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h1> Sign-up </h1>
        <div class="form-left">
            <div class="form-cloud-background">
                <div class="form-cloud-top">
                    <div class="form-cloud-bottom">
                        <div class="form-cloud-contents">
                            <% control page(my-events) %>
                            $RegisterMessage
                            <% end_control %>
                            $RegisterForm
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <% end_if %>
    </div>
    <div class="right-column">
        <% include facebook_like_box %>
        <% include action_box %>
    </div>
</div>