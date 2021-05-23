<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="artist_list.aspx.cs" Inherits="beatz.artist_list" %>
<div class="container">
    <div class="podcast-series">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="pod-series">
                    <div class="pod-info">
						<div class="d-flex align-items-center justify-content-around">
						<asp:image runat="server" ID="thumbnail" class="img-thumbnail" style="height:20vh;"></asp:image>
                        <div class="pod-info">
						<h3 style="text-align: center;">
                            <asp:label runat="server" ID="playlist_name" text=""></asp:label> 
						</h3>
                        <h4 style="text-align: center;">
                            <asp:label runat="server" ID="song_count" text=""></asp:label> 
                        </h4>
					</div>
					<div id="togglebutton" style="cursor:pointer" class="border shadow border-success p-3 rounded-circle text-success play_playlist"  data-playlist="<%= Request.QueryString["artist"] %>"><i id="play" class="fa fa-play" aria-hidden="true"></i></div>
					</div>
                        <ul class="d-flex flex-column m-5 align-items-around" id="song_list" runat="server">
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>