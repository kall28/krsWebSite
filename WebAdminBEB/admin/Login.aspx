<%@ page title="" language="C#" masterpagefile="~/masterpages/SiteMaster.master" autoeventwireup="true" inherits="admin_Login, App_Web_login.aspx.fdf7a39c" %>

<%@ MasterType VirtualPath="~/masterpages/SiteMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- Login Alternative Row -->
	<div class="container">
		<div class="row">
			<div class="col-md-5 col-md-offset-1">
				<div id="login-alt-container">
					<!-- Title -->
					<h1 class="push-top-bottom">
						<%--<i class="gi gi-flash"></i><strong>KRS InfoServe</strong>--%>
						<img id="xImgLogo" runat="server" src="~/img/Logo.png" height="70" width="185"><br>
						<small>Welcome to
							<asp:Literal ID="xlitCaption" runat="server"></asp:Literal>!</small>
					</h1>
					<!-- END Title -->

					<!-- Key Features -->
					<ul class="fa-ul text-muted">
						<%--<li><i class="fa fa-check fa-li text-success"></i>Clean &amp; Modern Design</li>
                            <li><i class="fa fa-check fa-li text-success"></i>Fully Responsive &amp; Retina Ready</li>
                            <li><i class="fa fa-check fa-li text-success"></i>10 Color Themes</li>
                            <li><i class="fa fa-check fa-li text-success"></i>PSD Files Included</li>
                            <li><i class="fa fa-check fa-li text-success"></i>Widgets Collection</li>
                            <li><i class="fa fa-check fa-li text-success"></i>Designed Pages Collection</li>
                            <li><i class="fa fa-check fa-li text-success"></i>.. and many more awesome features!</li>--%>
					</ul>
					<!-- END Key Features -->

					<!-- Footer -->
					<footer class="text-muted push-top-bottom">
						<small><span>2019</span> &copy; PT Cinemaxx Global Pasifik</small>
					</footer>
					<!-- END Footer -->
				</div>
			</div>
			<div class="col-md-5">
				<!-- Login Container -->
				<div id="login-container">
					<!-- Login Title -->
					<div class="login-title text-center">
						<h1><strong>Login</strong></h1>
					</div>
					<!-- END Login Title -->

					<!-- Login Block -->
					<div class="block push-bit">
						<!-- Login Form -->
						<div id="form-login" class="form-horizontal">
							<div class="form-group">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="gi gi-envelope"></i></span>
										<input type="text" id="login-email" name="login-email" class="form-control input-lg" placeholder="Email">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="gi gi-asterisk"></i></span>
										<input type="password" id="login-password" name="login-password" class="form-control input-lg" placeholder="Password">
									</div>
								</div>
							</div>
							<div class="form-group form-actions">
								<div class="col-xs-4">
									<label class="switch switch-primary" data-toggle="tooltip" title="Remember Me?">
										<input type="checkbox" id="login-remember-me" name="login-remember-me" checked>
										<span></span>
									</label>
								</div>
								<div class="col-xs-8 text-right">
									<button type="submit" id="btnLogin" class="btn btn-sm btn-primary"><%--<i class="fa fa-angle-right"></i>--%>Login to Dashboard</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12 text-center">
									<a href="javascript:void(0)" id="link-reminder-login"><small>Forgot password?</small></a>
									<%--<a href="javascript:void(0)" id="link-register-login"><small>Create a new account</small></a>--%>
								</div>
							</div>
						</div>
						<!-- END Login Form -->

						<!-- Reminder Form -->
						<div id="form-reminder" class="form-horizontal display-none">
							<div class="form-group">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="gi gi-envelope"></i></span>
										<input type="text" id="reminder-email" name="reminder-email" class="form-control input-lg" placeholder="Email">
									</div>
								</div>
							</div>
							<div class="form-group form-actions">
								<div class="col-xs-12 text-right">
									<button type="button" class="btn btn-sm btn-primary" id="btnResetPwd"><%--<i class="fa fa-angle-right"></i>--%>Reset Password</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12 text-center">
									<small>Did you remember your password?</small> <a href="javascript:void(0)" id="link-reminder"><small>Login</small></a>
								</div>
							</div>
						</div>
						<!-- END Reminder Form -->

						<!-- Register Form -->
						<div id="form-register" class="form-horizontal display-none">
							<div class="form-group">
								<div class="col-xs-6">
									<div class="input-group">
										<span class="input-group-addon"><i class="gi gi-user"></i></span>
										<input type="text" id="register-firstname" name="register-firstname" class="form-control input-lg" placeholder="Firstname">
									</div>
								</div>
								<div class="col-xs-6">
									<input type="text" id="register-lastname" name="register-lastname" class="form-control input-lg" placeholder="Lastname">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="gi gi-envelope"></i></span>
										<input type="text" id="register-email" name="register-email" class="form-control input-lg" placeholder="Email">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="gi gi-asterisk"></i></span>
										<input type="password" id="register-password" name="register-password" class="form-control input-lg" placeholder="Password">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="gi gi-asterisk"></i></span>
										<input type="password" id="register-password-verify" name="register-password-verify" class="form-control input-lg" placeholder="Verify Password">
									</div>
								</div>
							</div>
							<div class="form-group form-actions">
								<div class="col-xs-6">
									<a href="#modal-terms" data-toggle="modal" class="register-terms">Terms</a>
									<label class="switch switch-primary" data-toggle="tooltip" title="Agree to the terms">
										<input type="checkbox" id="register-terms" name="register-terms">
										<span></span>
									</label>
								</div>
								<div class="col-xs-6 text-right">
									<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-plus"></i>Register Account</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12 text-center">
									<small>Do you have an account?</small> <a href="javascript:void(0)" id="link-register"><small>Login</small></a>
								</div>
							</div>
						</div>
						<!-- END Register Form -->
					</div>
					<!-- END Login Block -->
				</div>
				<!-- END Login Container -->
			</div>
		</div>
	</div>
	<!-- END Login Alternative Row -->

	<!-- Modal Terms -->
	<div id="modal-terms" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Terms &amp; Conditions</h4>
				</div>
				<div class="modal-body">
					<h4>Title</h4>
					<p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<h4>Title</h4>
					<p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<h4>Title</h4>
					<p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					<p>Donec lacinia venenatis metus at bibendum? In hac habitasse platea dictumst. Proin ac nibh rutrum lectus rhoncus eleifend. Sed porttitor pretium venenatis. Suspendisse potenti. Aliquam quis ligula elit. Aliquam at orci ac neque semper dictum. Sed tincidunt scelerisque ligula, et facilisis nulla hendrerit non. Suspendisse potenti. Pellentesque non accumsan orci. Praesent at lacinia dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- END Modal Terms -->
	<script src="js/login-1.0.js"></script>
	<script>$(function () { Login.init(); });</script>
</asp:Content>

