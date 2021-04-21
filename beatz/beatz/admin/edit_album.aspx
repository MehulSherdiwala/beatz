<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="edit_album.aspx.cs" Inherits="beatz.admin.edit_album" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="header pb-6 d-flex align-items-center"
             style="min-height: 400px; background-image: url(assets/img/album.jpg); background-size: cover;background-repeat: no-repeat; background-position: center top;">
             <span class="mask bg-gradient-default opacity-7"></span>
             <div class="container-fluid d-flex flex-column justify-content-center align-items-center col">
                 <div class="row">
                     <h1 class="display-1 text-white">Add Album</h1>
                 </div>
                 <div class="row">
                     <p class="text-white mt-0 mb-5">You can select album while uploading songs.
                     </p>
                 </div>
             </div>
         </div>
         <div class="container mt--9">
            <div class="card">
                 <div class="card-header">
                    <div class="row justify-content-start pl-lg-4">
                         <h3 class="mb-0">Album Information</h3>
                    </div>
                 </div>
                 <div class="card-body">
                <div class="pl-lg-4 pt-4">
                    <div class="row">
                        <div class="col-lg-5">
                        <div class="form-group">
                            <label class="form-control-label" for="txt_name">Album Name</label>
                            <asp:TextBox ID="txt_name" placeholder="Ex. Acoustic" CssClass="form-control"  runat="server"></asp:TextBox>
                        </div>
                        </div>
                        <div class="col-lg-5 offset-lg-1">
                        <div class="form-group ">
                            <label class="form-control-label" for="fu_image">Album Image</label> <br />
                            <asp:Image ID="album_img" runat="server" CssClass="img-fluid img-thumbnail" Width="20%" />
                            <asp:FileUpload ID="fu_image" CssClass="form-control" runat="server" />
                        </div>
                        </div>
                        <div class="row flex justify-content-center text-danger">
                            <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>  
                 </div>
                <div class="row flex justify-content-center">
                        <asp:HiddenField ID="txt_id" runat="server" />
                        <asp:Button ID="editAlbum" CssClass="btn btn-success px-5 my-4" runat="server" Text="Save" OnClick="editAlbum_Click"/>
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
