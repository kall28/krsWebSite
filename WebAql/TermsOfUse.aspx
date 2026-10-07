<%@ page title="" language="C#" masterpagefile="~/MasterPage/SitePageMaster.master" autoeventwireup="true" inherits="TermsOfUse, App_Web_termsofuse.aspx.cdcab7d2" %>

<%@ MasterType VirtualPath="~/MasterPage/SitePageMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- breadcrumbs -->
	<section class="breadcrumbs separator-bottom">
		<div class="container">
			<div class="row">
				<div class="col">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)" onclick="WebNavHelper.redirectToPageMain('home');">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Terms and Conditions</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>


	<!-- hero -->
	<section>
		<div class="container">
			<div class="row">
				<div class="col">
					<h1>Terms and Conditions</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="">
		<div class="container">
			<div class="row gutter-2 gutter-md-4">
				<div class="col-md-12 col-lg-12">
					<div class="tncWrap1" id="">
						<!-- <div class="accordion accordion-minimal" id="accordion-1"> -->
						<asp:Literal ID="xlitContent" runat="server"></asp:Literal>
						<%--<ol start="1">
							<li>Website Terms of Use
                               
								<ol>
									<li>The terms and conditions set out below will govern your use of this website.</li>
									<li>The Site is owned and operated by Aqua Leaf Farms.</li>
									<li>Please read these Terms carefully. By continuing to access and use the Site you are deemed to have
                                        understood and agreed to them. If you do not agree to them you must refrain from using this Site and
                                        any services available through it.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="2">
							<li>Disclaimer
                               
								<ol>
									<li>This Site contains information, text, data, graphics, photographs, illustrations, artwork, names,
                                        logos, trademarks and information about Aqua Leaf Farms and its partners and on the products and
                                        services it and they provide.
									</li>
									<li>The Site, Information and Content (as described below) is provided &ldquo;as is&rdquo; and on an
                                        &ldquo;as available&rdquo; basis only and Aqua Leaf Farms does not give any representation,
                                        warranty, condition or other term as to its timeliness, completeness, accuracy, performance or
                                        fitness for a particular purpose of the Site or any of the Content or Information. Aqua Leaf Farms
                                        has tried to ensure that all the Information provided on the Site is correct at the time of
                                        publication. However no responsibility is accepted by or on behalf of Aqua Leaf Farms for any
                                        errors, omissions, or inaccurate Information or Content on the Site. Further, Aqua Leaf Farms does
                                        not warrant that the Site will be uninterrupted or error free or that any defects will be corrected.
									</li>
									<li>Aqua Leaf Farms accepts no liability for the results of any action taken on the basis of the
                                        Information or Content and all implied warranties, conditions and other terms including but not
                                        limited to the implied warranties, conditions or terms of satisfactory quality, fitness for a
                                        particular purpose, non-infringement, compatibility, security and accuracy are excluded from these
                                        Terms to the extent that they may be excluded as a matter of law. We do not attempt to exclude any
                                        rights you may otherwise have as a consumer that we cannot exclude as a matter of law.
									</li>
									<li>Without prejudice to clause, save in respect of death or personal injury resulting from our
                                        negligence or fraud, neither Aqua Leaf Farms nor any of its directors, employees or other
                                        representatives will be liable for any loss you suffer including, without limitation, indirect or
                                        consequential loss, or any damages arising from loss of use, data or profits, whether in contract,
                                        tort or otherwise, arising out of or in connection with the use of this Site.
									</li>
									<li>You accept that after you leave this Site (whether knowingly or not) Aqua Leaf Farms can no longer
                                        be responsible in any way for any material that you encounter and We exclude to the fullest extent
                                        permitted by law all liability that may arise with respect to or as a result of such material
                                        causing any damage, costs, injury or financial loss of any kind.
									</li>
									<li>You indemnify and hold Aqua Leaf Farms and any of its officers, employees or agents harmless from
                                        and against all and any expenses, losses, liabilities, damages, costs or expenses incurred or
                                        suffered and any claims or legal proceedings which are brought or threatened, in each case arising
                                        from your use of, or conduct on, the Site, any provision or use of your Content and/or any breach of
                                        these Terms.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="3">
							<li>Registration
                               
								<ol>
									<li>To receive email newsletters or use any services we provide through the Site, you must register
                                        your details with Us (including your name and e-mail address) to become a registered user
                                        (&ldquo;User&rdquo;). You understand and acknowledge that to the extent the data submitted by You
                                        amounts to personal information, such personal information will be processed in accordance with the
                                        requirements of applicable data protection laws and our privacy policy.
									</li>
									<li>You are solely responsible for all use of and for protecting the confidentiality of your email
                                        verification and password. You must not share this information with any third parties. You must
                                        notify Us immediately of any unauthorised use of them or any other breach of security regarding Our
                                        Site that comes to your attention. Additionally, you indemnify Us against any unauthorised use of
                                        your User details, including use by a third party where you have allowed or facilitated access.
									</li>
									<li>You undertake to register as a User using accurate, complete and current information and to
                                        maintain and update any changes to that information.
									</li>
									<li>You acknowledge that permission to become a User is granted at the sole discretion of Aqua Leaf
                                        Farms and such permission may be withdrawn at any time without notice.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="4">
							<li>Linking
                               
								<ol>
									<li>Websites or web pages to which this Site is linked are for information purposes and have not been
                                        reviewed by Aqua Leaf Farms. To the extent that such websites or web pages do not contain
                                        information about Aqua Leaf Farms, we accept no responsibility for the content of such Sites or web
                                        pages, nor do we accept responsibility for any losses or penalties incurred as a result of your use
                                        of any links or reliance on the content of any website to which this Site is linked.
									</li>
									<li>When you access a website, through a link from the Site, you accept that it is independent from
                                        the Site and that Aqua Leaf Farms has no control over the content of the linked third party website.
                                        Accordingly a link to a website does not mean that Aqua Leaf Farms endorses or accepts any duty or
                                        responsibility for the content, accuracy or the use of the contents of such website. The content on
                                        third party websites may change without notice to Aqua Leaf Farms. You should take precautions to
                                        insure protection of your privacy as well as to insure against Destructive Features (as described
                                        below).
									</li>
									<li>You may not frame this Site within any other website.</li>
								</ol>
							</li>
						</ol>
						<ol start="5">
							<li>Computer Viruses, Worms and Trojan Horses
                               
								<ol>
									<li>Whilst we use reasonable endeavours to protect this Site (including Information and downloads)
                                        from computer viruses, worms, Trojan Horses and other such destructive features (the
                                        &ldquo;Destructive Features&rdquo;), we do not warrant that the Site is free from such Destructive
                                        Features and accept no liability for any damage that may result from the transmission of any
                                        Destructive Feature via this Site or via any files which are available for you to download from the
                                        Site. You are responsible for implementing sufficient procedures and virus checks (including
                                        anti-virus and other security checks) to satisfy your particular requirements for the accuracy of
                                        data input and output.
									</li>
									<li>You are responsible for ensuring that your computer system meets all relevant technical
                                        specifications necessary to use the Site or any service made available through it and that it is
                                        compatible with the Site. We give no warranty, condition or other term that the Information is
                                        compatible with all computer systems and browsers.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="6">
							<li>Intellectual Property Rights and Reproduction
                               
								<ol>
									<li>Except as is otherwise indicated on the Site, Aqua Leaf Farms and/or its licensors own the
                                        copyright in all the Information featured on this Site and all related intellectual property rights,
                                        including but not limited to all database rights, unregistered and registered trademarks, service
                                        marks and logos. You should not infer any affiliation, sponsorship or endorsement from the use of
                                        third party marks on the Site, as such marks are used solely to designate certain products or
                                        services as belonging to their owners. Nothing in this Site is intended to grant, by implication or
                                        otherwise, any licence or right under any patent, trade mark or other intellectual property owned by
                                        Aqua Leaf Farms or any licensor or third party.
									</li>
									<li>You are permitted to download, print, store temporarily, retrieve and display Information from the
                                        Site on a computer screen, print individual pages on paper (but not photocopy them) and store such
                                        pages in electronic form on disk (but not on any server or other storage device connected to the
                                        network) for your personal use or for internal use within your organisation.
									</li>
									<li>You are not permitted (except where we have given you express permission to do so or you are
                                        otherwise permitted to do so by law) to adapt, modify, copy, reproduce, distribute, republish,
                                        disassemble, decompile, reverse engineer, create derivative works from, download, post, broadcast,
                                        transmit or re-transmit in any other way any of the Information on the Site.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="7">
							<li>Your Further Use of This Site
                               
								<ol>
									<li>You further agree not to use any Information on the Site except to the extent necessary to enable
                                        you to use the Site and the services provided through it. You shall not use the Site for any immoral
                                        or illegal purpose. In particular you agree that you will not:
									</li>
									<li>a) upload any files that contain any Destructive Features; or</li>
									<li>b) in any way damage, disable or impair the operation of the Site, or attempt to gain unauthorised
                                        access to the Site or to network connected to it, by hacking, spoofing or other such similar means.
									</li>
								</ol>
							</li>
							<li>Data Protection and the Aqua Leaf Farms Privacy &amp; Cookies Policy
                               
								<ol>
									<li>We may require basic information which identifies you as an individual, such as your name and
                                        email address, in order to enable you to take advantage of our services. We will only use such
                                        personal information for the purposes of providing information or services which you have requested
                                        or for other related purposes as set out in our Cookies Policy and Privacy Notice, which form part
                                        of these Terms.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="9">
							<li>Complaints or Queries
                               
								<ol>
									<li>In the event that you have any complaints or queries concerning our services or about this Site
                                        generally, please get in touch with us on info@aqualeaf.in
									</li>
								</ol>
							</li>
						</ol>
						<ol start="10">
							<li>Changes to these Terms
                               
								<ol>
									<li>Aqua Leaf Farms reserves the right, at its discretion, to make changes to any part of this Site,
                                        the Information or these Terms. Should these Terms be amended, we will publish details of the
                                        amendments on the Site. It is your responsibility to refer to and comply with these Terms on
                                        accessing this Site. Failure to comply may lead to action being taken against you. By continuing to
                                        use the Site after we have published the notification you agree to be bound by these Terms as
                                        amended.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="11">
							<li>Severability and waiver
                               
								<ol>
									<li>If these Terms or any part of them should be determined to be illegal, invalid or otherwise
                                        unenforceable under the laws of any state or country in which these Terms are intended to be
                                        effective, then to the extent that they are so illegal, invalid or unenforceable, they shall in that
                                        state or country be treated as severed and deleted from these Terms and the remaining terms shall
                                        survive and remain in full force and effect and continue to be binding and enforceable in that state
                                        or country.
									</li>
									<li>If you breach these Terms and We take no action against you, We will still be entitled to enforce
                                        Our rights against you in relation to that breach and to use Our rights and remedies in any other
                                        situation where you breach these Terms.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="12">
							<li>Events beyond our control
                               
								<ol>
									<li>Aqua Leaf Farms will not be responsible for any breach of these Terms (including in relation to
                                        supplying any Product or Subscription) caused by circumstances beyond its reasonable control,
                                        including without limitation acts of god, war, terrorism or technical difficulties.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="13">
							<li>Third Party Rights
                               
								<ol>
									<li>Except for our affiliates, directors, employees or representatives, a person who is not a party to
                                        these Terms has no statutory or other right to enforce them, to the extent that any such right can
                                        be lawfully excluded.
									</li>
								</ol>
							</li>
						</ol>
						<ol start="14">
							<li>Entire Agreement
                               
								<ol>
									<li>Except for in the case of fraud, these Terms constitute the entire agreement between you and Aqua
                                        Leaf Farms in relation to the subject matter.
									</li>
								</ol>
							</li>
						</ol>--%>

					</div>
				</div>
			</div>
	</section>

</asp:Content>

