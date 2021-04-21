<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="add_genre.aspx.cs" Inherits="beatz.admin.add_genre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
         <div class="header pb-6 d-flex align-items-center"
             style="min-height: 400px; background-image: url(assets/img/genre.jpg); background-size: cover;background-repeat: no-repeat; background-position: center top;">
             <span class="mask bg-gradient-default opacity-6"></span>
             <div class="container-fluid d-flex flex-column justify-content-center align-items-center col">
                 <div class="row">
                     <h1 class="display-1 text-white">Add Genre</h1>
                 </div>
                 <div class="row">
                     <p class="text-white mt-0 mb-5">You can add genre from here and select it while uploading the songs.
                     </p>
                 </div>
             </div>
         </div>
         <div class="container mt--9">
            <div class="card">
                 <div class="card-header">
                    <div class="row justify-content-start pl-lg-4">
                         <h3 class="mb-0">Genre Information</h3>
                    </div>
                 </div>
                 <div class="card-body">
                       <div class="pl-lg-4 pt-4">
                          <div class="row">
                             <div class="col-lg-4">
                                <div class="form-group">
                                   <label class="form-control-label" for="txt_name">Genre Name</label>
                                    <asp:TextBox ID="txt_name" placeholder="Ex. Acoustic" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                             </div>
                             <div class="col-lg-7 offset-lg-1">
                                <div class="form-group">
                                   <label class="form-control-label" for="txt_desc">Genre Discription</label>
                                    <asp:TextBox ID="txt_desc" placeholder="Ex. This genre blends influences from folk, bluegrass, jazz and uses only acoustic instruments" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                             </div>
                              <div class="row flex justify-content-center text-danger">
                                  <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                              </div>
                          </div>
                          <div class="row flex justify-content-center">
                              <asp:Button ID="addGenre" runat="server" CssClass="btn btn-success px-5 my-4" Text="Add Genre" OnClick="addGenre_Click" />
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
