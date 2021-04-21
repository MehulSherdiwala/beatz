<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="add_artist.aspx.cs" Inherits="beatz.admin.add_artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header pb-6 d-flex align-items-center"
             style="min-height: 400px; background-image: url(assets/img/artist.jpg); background-size: cover;background-repeat: no-repeat; background-position: center top;">
             <span class="mask bg-gradient-default opacity-5"></span>
             <div class="container-fluid d-flex flex-column justify-content-center align-items-center col">
                 <div class="row">
                     <h1 class="display-1 text-white">Add Artist</h1>
                 </div>
                 <div class="row">
                     <p class="text-white mt-0 mb-5">Visible to all the user
                     </p>
                 </div>
             </div>
         </div>
         <div class="container mt--9">
            <div class="card">
                 <div class="card-header">
                    <div class="row justify-content-start pl-lg-4">
                         <h3 class="mb-0">Artist Information</h3>
                    </div>
                 </div>
                 <div class="card-body">
                       <div class="pl-lg-4 pt-4">
                          <div class="row">
                             <div class="col-lg-5">
                                <div class="form-group">
                                   <label class="form-control-label" for="txt_name">Artist Name</label>
                                    <asp:TextBox ID="txt_name" CssClass="form-control" placeholder="Ex. Shreya Ghoshal" runat="server"></asp:TextBox>
                                </div>
                             </div>
                             <div class="col-lg-5 offset-lg-1">
                                <div class="form-group ">
                                    <label class="form-control-label" for="image">Artist Image</label>
                                    <asp:FileUpload ID="fu_image" CssClass="form-control" runat="server" />
                                </div>
                             </div>
                             <div class="col-lg-5">
                                <div class="form-group ">
                                    <label class="form-control-label" for="image">Artist gender</label>
                                    <div class="form-group mb-3">
                                        <asp:RadioButton ID="male" runat="server" GroupName="gender" Checked="true" Text="Male" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <asp:RadioButton ID="female" runat="server" GroupName="gender" Text="Female" />
                                    </div>
                                    <!-- <div class="custom-control custom-radio">
                                        <asp:RadioButton ID="other" runat="server" GroupName="gender" CssClass="custom-control-input" Text="Other" />
                                       <label class="custom-control-label" for="other">Other</label>
                                     </div> -->
                                </div>
                             </div>
                             <div class="col-lg-5 offset-lg-1">
                                <div class="form-group">
                                   <label class="form-control-label" for="genre-name">Artist description</label>
                                    <asp:TextBox ID="txt_desc" CssClass="form-control" runat="server" placeholder="Ex. Shreya Ghoshal (born 12 March 1984) is an Indian playback singer. She has received four National Film Awards" TextMode="MultiLine"></asp:TextBox>
                                 </div>
                             </div>
                          </div>
                           <div class="row flex justify-content-center text-danger">
                                  <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                              </div>
                          <div class="row flex justify-content-center">
                              <asp:Button ID="addArtist" CssClass="btn btn-success px-5 my-4" runat="server" Text="Add" OnClick="addArtist_Click" />
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
