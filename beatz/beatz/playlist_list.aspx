<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="playlist_list.aspx.cs" Inherits="beatz.playlist_list" %>


<div class="container">
    <div class="podcast-series">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="pod-series">
                    <div class="pod-info">
						<div class="d-flex align-items-center justify-content-around">
						<img class="img-thumbnail" style="height:20vh;" src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bXVzaWN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60" alt="">
                        <div class="pod-info">
                        <h3 style="text-align: center;">
                            <asp:label runat="server" ID="playlist_name" text=""></asp:label> 
						</h3>
                        <h4 style="text-align: center;">
                            <asp:label runat="server" ID="song_count" text=""></asp:label> 
                        </h4>
					</div>
					<div id="togglebutton" style="cursor:pointer" class="border shadow border-success p-3 rounded-circle text-success play_playlist"  data-playlist="<%= Request.QueryString["playlist"] %>"><i id="play" class="fa fa-play" aria-hidden="true"></i></div>
					</div>
                        <ul class="d-flex flex-column m-5 align-items-around" id="song_list" runat="server">
                            <li class="my-4">
                                <div class="d-flex justify-content-around">
                                <div class="mm-audio">
                                                        
                                        <audio controls src="http://www.jplayer.org/audio/mp3/Miaow-04-Lismore.mp3"></audio>
                                                        
                                </div>
                                <div class="d-flex flex-column mx-2 align-items-center"> 
                                <p class="h4">The Moorditj Mag Podcast: Ep #20</p>
                                <p>Shreya ghoshal
                                                    
                                </p>
                            </div>
							<p>3:04</p>
                            </div>
                            </li>
                            <li class="my-4">
                                <div class="d-flex justify-content-around">
                                <div class="mm-audio">
                                    <span data-music='4' class='download play_playlist'><i class='fa fa-play'></i></span>
                                </div>
                                <div class="d-flex flex-column mx-2 align-items-center"> 
                                <p class="h4">The Moorditj Mag Podcast: Ep #20</p>
                                <p>Shreya ghoshal
                                                    
                                </p>
                            </div>
							<p></p>
                            </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
