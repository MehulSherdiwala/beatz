<%@ Page Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="beatz.admin.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header bg-success pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <div class="row justify-content-center align-items-center py-4">
             <p class="breadcrumb h2 p-5">
               Welcome to the admin panel
             </p>
          </div>
        </div>
      </div>
    </div>
     <div class="container-fluid mt--6">
      <div class="d-flex justify-content-around row">
          <div class="col-3 card" style="background-color:mistyrose;">
            <div class="card-header border-0 d-flex justify-content-center" style="background-color:mistyrose;">
                <i class="fas fa-sliders-h fa-5x text-orange"></i>
            </div>
             <div class="card-body d-flex justify-content-between">
                 <p class="h3">Genre</p>
                 <p class="h3">
                     <asp:Label ID="lbl_genre" runat="server"></asp:Label>
                 </p>
             </div>
          </div>
          <div class="col-3 card" style="background-color:papayawhip;">
            <div class="card-header border-0 d-flex justify-content-center" style="background-color:papayawhip;">
                <i class="fas fa-compact-disc text-yellow fa-5x"></i>
            </div>
             <div class="card-body d-flex justify-content-between">
                 <p class="h3">Albums</p>
                 <p class="h3">
                     <asp:Label ID="lbl_album" runat="server"></asp:Label>

                 </p>
             </div>
          </div>
          <div class="col-3 card" style="background-color:lavenderblush;">
            <div class="card-header border-0 d-flex justify-content-center" style="background-color:lavenderblush;">
                <i class="fas fa-layer-group text-pink fa-5x"></i>
            </div>
             <div class="card-body d-flex justify-content-between">
                 <p class="h3">Playlist</p>
                 <p class="h3">
                     <asp:Label ID="lbl_playlist" runat="server"></asp:Label></p>
             </div>
          </div>
          
      </div>
         <div class="d-flex justify-content-around row">
          <div class="col-3 card" style="background-color:#D7DCF8;">
            <div class="card-header border-0 d-flex justify-content-center" style="background-color:#D7DCF8;">
                <i class="fas fa-music text-primary fa-5x"></i>
            </div>
             <div class="card-body d-flex justify-content-between">
                 <p class="h3">Music</p>
                 <p class="h3">
                     <asp:Label ID="lbl_music" runat="server"></asp:Label></p>
             </div>
          </div>
          <div class="col-3 card" style="background-color:lightgray;">
            <div class="card-header border-0 d-flex justify-content-center" style="background-color:lightgray;">
                <i class="fas fa-user text-default fa-5x"></i>
            </div>
             <div class="card-body d-flex justify-content-between">
                 <p class="h3">Artists</p>
                 <p class="h3">
                     <asp:Label ID="lbl_artist" runat="server"></asp:Label></p>
             </div>
          </div>
      </div>
      <footer class="footer pt-0">
         <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6">
               <div class="copyright text-center  text-lg-left  text-muted">
                  &copy; 2021 <a href="https://www.creative-tim.com/" class="font-weight-bold ml-1"
                     target="_blank">Beatz</a>
               </div>
            </div>
         </div>
      </footer>
    </div>
</asp:Content>

