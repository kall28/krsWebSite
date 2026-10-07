<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="PasswordRecovery, App_Web_passwordrecovery.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<script src="js/web.resetpwd-1.0.js"></script>
	<section class="pt-5" id="divFP">
		<div class="container py-5 py-sm-6 py-md-7">
			<div class="row justify-content-center pt-4">
				<div class="col-lg-7 col-md-9 col-sm-11">
					<h1 class="h2 pb-3">Forgot your password?</h1>
					<p class="font-size-sm">Change your password in three easy steps. This helps to keep your new password secure.</p>
					<ul class="list-unstyled font-size-sm pb-1 mb-4">
						<li><span class="text-primary font-weight-semibold mr-1">1.</span>Fill in your email below.</li>
						<li><span class="text-primary font-weight-semibold mr-1">2.</span>We'll email you a temporary code.</li>
						<li><span class="text-primary font-weight-semibold mr-1">3.</span>Use the code to change your password on our secure website.</li>
					</ul>
					<div class="bg-light rounded-lg px-3 py-4 p-sm-4">
						<div class="form-group">
							<div class="input-group-overlay form-group">
								<!-- <div class="input-group-prepend-overlay"><span class="input-group-text"><i class="fe-mail"></i></span></div> -->
								<input class="form-control prepended-form-control bg-white" type="text" id="txtFPUserName" placeholder="Email">
							</div>
						</div>
						<button class="btn btn-primary mt-1" type="button" id="btnFPSubmit">Get new password</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="pt-5" id="divFPVerify" style="display: none">
		<div class="container py-5 py-sm-6 py-md-7">
			<div class="row justify-content-center pt-4">
				<div class="col-lg-7 col-md-9 col-sm-11">
					<h1 class="h2 pb-3">Verify your email</h1>
					<p class="font-size-sm">Please enter the OTP shared on your email.</p>
					<div class="bg-secondary rounded-lg px-3 py-4 p-sm-4">
						<div class="needs-validation p-2">
							<div class="form-group">
								<label class="form-label" for="recovery-email">Enter OTP</label>
								<input class="form-control bg-white" type="password" id="txtFPVerOTP">
							</div>
							<button class="btn btn-primary mt-1" type="button" id="btnFPVerSubmit">Submit</button>
							<button class="btn btn-primary mt-1" type="button" id="btnFPVerResend">Resend OTP</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="pt-5" id="divFPResetPwd" style="display: none">
		<div class="container py-5 py-sm-6 py-md-7">
			<div class="row justify-content-center pt-4">
				<div class="col-lg-7 col-md-9 col-sm-11">
					<h1 class="h2 pb-3">Reset your password</h1>
					<div class="bg-secondary rounded-lg px-3 py-4 p-sm-4">
						<div class="needs-validation p-2">
							<div class="form-group">
								<label class="form-label" for="recovery-email">Enter Password</label>
								<input class="form-control bg-white" type="password" id="txtFPResetPwd">
							</div>
							<div class="form-group">
								<label class="form-label" for="recovery-email">Confirm password</label>
								<input class="form-control bg-white" type="password" id="txtFPResetPwdCrfm">
							</div>
							<button class="btn btn-primary mt-1" type="button" id="btnFPResetSubmit">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="pt-5" id="divFpCrfm" style="display: none">
		<div class="container py-5 py-sm-6 py-md-7">
			<div class="row justify-content-center pt-4">
				<div class="col-lg-7 col-md-9 col-sm-11">
					<%--<h1 class="h2 pb-3">Welcome back to the Aqua Leaf Farms.</h1>--%>
					<p class="font-size-sm">Your password reset successfully. Please sign in to continue</p>
					<div class="bg-secondary rounded-lg px-3 py-4 p-sm-4">
						<div class="needs-validation p-2">
							<button class="btn btn-primary" type="button" id="btnFPCrfm">Sign In</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>

