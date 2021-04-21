<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="beatz.admin.login" %>

<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="Content-Language" content="en"> 
  <title>Login</title>
  <link rel = "icon" href ="assets/img/title.png" type = "image/x-icon"> 
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <link rel="stylesheet" href="assets/vendor/%40fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <link rel="stylesheet" href="assets/css/style.css" type="text/css">
</head>
<body class="bg-default">
  <div class="main-content">
    <div class="header bg-gradient-success py-7 py-lg-8 pt-lg-9">
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <div class="container mt--9 pb-5">
      <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
          <div class="card bg-secondary border-0 mb-0">
            <div class="card-body px-lg-5 py-lg-5">
              <div class="text-center h1 mb-4">
                <small>Enter your Credentials</small>
              </div>
              <form role="form" runat="server">
                <div class="form-group my-4">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fa fa-user"></i></span>
                    </div>
                      <asp:TextBox ID="txt_email" runat="server" CssClass="form-control"  placeholder="Email id"></asp:TextBox>
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-merge input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fa fa-unlock"></i></span>
                    </div>
                      <asp:TextBox ID="txt_password" placeholder="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                  </div>
                </div>
                  <div class="text-center text-danger">
                      <asp:Label ID="error" runat="server" Text=""></asp:Label></div>
                <div class="text-center">
                    <asp:Button ID="submit" runat="server" CssClass="btn btn-success mt-4" Text="Sign In" OnClick="submit_Click" />
                </div>
              </form>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-6">
              <a href="#" class="text-light"><small>Forgot password?</small></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>