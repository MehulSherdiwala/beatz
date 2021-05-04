<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="edit_music.aspx.cs" Inherits="beatz.admin.edit_musid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header pb-6 d-flex align-items-center"
             style="min-height: 400px; background-image: url(assets/img/music.jpg); background-size: cover;background-repeat: no-repeat; background-position: center top;">
             <span class="mask bg-gradient-default opacity-7"></span>
             <div class="container-fluid d-flex flex-column justify-content-center align-items-center col">
                 <div class="row">
                     <h1 class="display-1 text-white">Edit Music</h1>
                 </div>
                 <div class="row">
                     <p class="text-white mt-0 mb-5">Upload music from here
                     </p>
                 </div>
             </div>
         </div>
         <div class="container mt--9">
            <div class="card">
                 <div class="card-header">
                    <div class="row justify-content-start pl-lg-4">
                         <h3 class="mb-0">Music Information</h3>
                    </div>
                 </div>
                 <div class="card-body">
                    <div class="pl-lg-4 pt-4">
                        <div class="row">
                            <div class="col-lg-5">
                            <div class="form-group">
                                <label class="form-control-label" for="music_name">Music Name</label>
                                <asp:TextBox ID="music_name" CssClass="form-control" placeholder="Ex. Afreen Afreen" runat="server"></asp:TextBox>
                            </div>
                            </div>
                            <div class="col-lg-5 offset-lg-1">
                            <div class="form-group">
                                <label class="form-control-label" for="artist">Artist</label>
                                <asp:ListBox ID="artist_box" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                                </div>
                            </div>
                            
                            <div class="col-lg-5">
                            <div class="form-group">
                                <label class="form-control-label" for="ddl_genre">Genre</label>
                                <asp:DropDownList ID="ddl_genre" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-5 offset-lg-1">
                            <div class="form-group">
                                <label class="form-control-label" for="ddl_album">Album</label>
                                <asp:DropDownList ID="ddl_album" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-5">
                            <div class="form-group ">
                                <label class="form-control-label" for="music">Music</label>
                                <asp:FileUpload ID="music" runat="server" CssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-lg-5 offset-lg-1">
                            <div class="form-group ">
                                <label class="form-control-label" for="image">Music Image</label>
                                <asp:FileUpload ID="image" CssClass="form-control" runat="server" />
                            </div>
                        </div>
                             
                        </div>
                        <div class="row flex justify-content-center">
                            <asp:HiddenField ID="music_id" runat="server" />
                            <asp:Button ID="editMusic" runat="server" Text="Save" CssClass="btn btn-success px-5 my-4" OnClick="editMusic_Click" />
                        </div>
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
