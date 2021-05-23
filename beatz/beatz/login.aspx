<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="beatz.login" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>BeatX - Audio Podcast and Music Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="BeatX - Multipurpose Audio Podcast and Music HTML Template" />
	<meta name="author" content="Softcircles">
	<meta name="keywords" content="" />
	<link rel="icon" href="images/favicon.png">
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/all.min.css">
	<link rel="stylesheet" type="text/css" href="css/slick.css">
	<link rel="stylesheet" type="text/css" href="css/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="css/flaticon.css">
	<link rel="stylesheet" type="text/css" href="css/maudio.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/color.css">
    <link rel="stylesheet" type="text/css" href="css/rtl.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
	<link rel="alternate stylesheet" type="text/css" href="css/color.css" title="color1" />
    <link rel="alternate stylesheet" type="text/css" href="css/color-schemes/color2.css" title="color2" />
    <link rel="alternate stylesheet" type="text/css" href="css/color-schemes/color3.css" title="color3" />
    <link rel="alternate stylesheet" type="text/css" href="css/color-schemes/color4.css" title="color4" />
    <link rel="alternate stylesheet" type="text/css" href="css/color-schemes/color5.css" title="color5" />
    <link rel="alternate stylesheet" type="text/css" href="css/color-schemes/color6.css" title="color6" />
</head>


<body>

	
	
	<div id="jquery_jplayer_1" class="cp-jplayer"></div>

	<div class="wrapper">


	
	
		<section class="pager-section">
			<div class="fixed-bg pager-bg"></div>
			<div class="container">
				<div class="pager-details text-center">
					<h2 class="page-title">Login & Register</h2>
					<ul class="breadcrumb">
						<li><a href="#" title="">Home</a></li>
						<li><span>Login & Register</span></li>
					</ul><!--breadcrumb end-->
				</div><!--pager-details end-->
			</div>
		</section><!--pager-section end-->

		<section class="block">
			<div class="container">
				<div class="login-register">
				    <form runat="server">
					    <div class="row">
						    <div class="col-lg-5">
							    <div class="lg-form">
								    <h3 class="mm-title">Login</h3>
									    <div class="form-group">
                                            <asp:TextBox ID="log_email" runat="server" placeholder="Email Address" class="form-control"></asp:TextBox>
									    </div>
									    <div class="form-group">
                                            <asp:TextBox ID="log_password" runat="server" placeholder="Password" class="form-control" TextMode="Password"></asp:TextBox>
									    </div>
									    <div class="form-group">
										    <a href="#" title="">Forget a Password</a>
                                            <asp:Button ID="Button1" runat="server" Text="Login " class="btn-default" OnClick="Button1_Click" />
										
									    </div>
							    </div><!--login end-->
						    </div>
						    <div class="col-lg-2">
							    <div class="or">
								    <span>Or</span>
							    </div>
						    </div>
						    <div class="col-lg-5">
							    <div class="lg-form">
								    <h3 class="mm-title">Not Yet Register?</h3>
									    <div class="form-group">
                                            <asp:TextBox ID="reg_name" runat="server" placeholder="Full Name" class="form-control"></asp:TextBox>
									    </div>
									    <div class="form-group">
                                            <asp:TextBox ID="reg_email" placeholder="Email Address" class="form-control" runat="server"></asp:TextBox>
									    </div>
									    <div class="form-group">
                                            <asp:TextBox ID="reg_phone" placeholder="Phone Number" class="form-control" runat="server"></asp:TextBox>
									    </div>
									    <div class="form-group">
                                            <asp:TextBox ID="reg_password" placeholder="Password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
									    </div>
									    <div class="form-group">
                                            <asp:TextBox ID="reg_conf_password" placeholder="Confirm Password" class="form-control" runat="server"></asp:TextBox>
									    </div>
									    <div class="form-group">
                                            <asp:Button ID="Button2" runat="server" class="btn-default" Text="Create New Account" OnClick="Button2_Click" />
									    </div>
							    </div><!--login end-->
						    </div>
                
					    </div>
					</form>
				</div><!--login-register end-->
				<div class="pl-section text-center">
					<div class="section-title text-center">
						<span>Artists’ rights and making the music</span>
						<h2>RELEASE ALL YOUR MUSIC ON...</h2>
					</div><!--section-title end-->
					<div class="pl-logos">
						<div class="pl-logo">
							<img src="images/resources/pl-1.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-2.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-3.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-4.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-5.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-1.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-2.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-3.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-4.png" alt="">
						</div><!--pl-logo end-->
						<div class="pl-logo">
							<img src="images/resources/pl-5.png" alt="">
						</div><!--pl-logo end-->
					</div><!--pl-logos end-->
					</div><!--pl-section end-->
			</div>
		</section>



		<footer>
			<div class="container">
				<div class="top-footer">
					<div class="row">
						<div class="col-lg-3 col-md-6">
							<div class="widget widget-about">
								<h3>Pune</h3>
								<p>Survey No,124,<br />Jijau Masaheb Marg, Kothrud.</p>
							</div><!--widget-about end-->
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="widget widget-contact">
								<ul>
									<li>+91 987 654 3210</li>
									<li><a href="mailto:beatzz121@gmail.com" title="">beatzz121@gmail.com</a></li>
								</ul>
							</div><!--widget-contact end-->
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="widget widget-links">
								<ul class="wd-links">
									<li><a href="#" title="">Accessibility</a></li>
									<li><a href="#" title="">Contact</a></li>
									<li><a href="#" title="">Privacy and Cookie </a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="bottom-footer">
					<div class="row">
						<div class="col-lg-3">
							<div class="btm-logo">
								<img src="images/logo.png" alt="">
							</div>
						</div>
						<div class="col-lg-9">
							<ul class="btm-links">
								<li><a href="index.html" title="">Home</a></li>
								<li><a href="about.html" title="">About Us</a></li>
								<li><a href="authors.html" title="">Authors</a></li>
								<li><a href="contact.html" title="">Contact</a></li>
							</ul>
							<p class="copyright-txt"><strong>BeatZ</strong> - Copyright 2021.</p>
						</div>
					</div>
				</div>
			</div>
		</footer>


<script src="js/all.min.js"></script>


</body>
</html>
