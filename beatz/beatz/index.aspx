<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="beatz.index" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BeatZ</title>
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
    <link rel="stylesheet" type="text/css" href="css/jplayer.blue.monday.min.css" />
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
    <style>
        .beatx-playyer .jp-audio .jp-play {
            width: 50px;
            height: 50px;
            line-height: 52px;
        }

        .beatx-playyer .jp-play i {
            font-size: 20px;
        }

        .musicc-controls .beatx-playyer .jp-title {
            margin-bottom: 0px;
            font-size: 23px;
        }

        .jp-audio .jp-interface, .jp-audio-stream .jp-interface {
            height: 100px !important;
        }

        .musicc-controls .beatx-playyer .jp-audio .jp-controls {
            margin-bottom: 5px;
        }

        .beatx-playyer .jp-audio .jp-type-playlist .jp-time-holder {
            height: 19px;
        }

        .beatx-playyer .jp-current-time, .beatx-playyer .jp-duration,
        .beatx-playyer .jp-toggles button {
            font-size: 17px;
        }

        .fixed-player {
            position: fixed;
            bottom: 0;
            z-index: 999;
        }
        .pod-thumbnail img{
            height: 200px;
        }
        .mm-audio span{
            text-align: center; 
            position: relative; 
            cursor: pointer;
            bottom: 0;
            right: 0
        }
        
        ul li ul.dropdown {
            min-width: 100%;
            /* Set width of the dropdown */
            background: #f2f2f2;
            display: none;
			position: absolute;
            z-index: 999;
            left: 0;
        }
		ul li ul * {
			padding: 20px;
		}
        li:hover ul.dropdown {
            display: flex;
			flex-direction: column;
            /* Display the dropdown */
        }
		.tile{
			color:white;
		}
		.tile:hover{
			color: #00D665;
		}
    </style>
</head>
<body>
    <div id="jquery_jplayer_1" class="cp-jplayer"></div>

    <div class="wrapper">

        <header>
            <div class="top-header">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-8 col-lg-7 col-md-6">
                            <ul class="tp-links">
                                <li><a href="#" title="">Who We Are</a></li>
                            </ul>
                        </div>
                        <div class="col-xl-4 col-lg-5 col-md-6 mll-auto  d-flex align-items-center">
                            <asp:MultiView ID="MultiView1" runat="server">
                                <asp:View ID="View1" runat="server">
                                    <a href="login.aspx" title="" class="login mr-4"><i class="flaticon-user"></i>Login or Register</a>
                                </asp:View>
                                <asp:View ID="View2" runat="server">
                                    <ul class="mr-4">
								<li>
									<a class="tile" href="#">
                                        <asp:Label ID="lbl_username" runat="server"></asp:Label></a>
									<ul class="dropdown">
										<li><a href="#/create_playlist">Create Playlist</a></li>
										<li><a href="#/user_playlist">My Playlist</a></li>
										<li><a href="logout.aspx">Logout</a></li>
									</ul>
								</li>
							</ul>
                                </asp:View>
                            </asp:MultiView>
                            <ul class="social-links">
                                <li><a href="#" title=""><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" title=""><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" title=""><i class="fab fa-instagram"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottom-header">
                <div class="container">
                    <div class="header-content">
                        <div class="logo">
                            <a href="#/home" title=""><img src="images/logo.png" alt=""></a>
                        </div>
                        <nav>
                            <ul>
                                <li><a href="#/home" class="home">Home</a></li>
                                <li><a href="#/artist" class="authors">Artists</a></li>
                                <li><a href="#/album">Albums</a></li>
                                <li><a href="#/genre">Genre</a></li>
                            </ul>
                        </nav>
                        <a href="#" title="" id="toggle" class="menu-btn"><img src="images/bars.png" alt=""></a>
                    </div>
                </div>
            </div>
        </header>

        <div class="responsive-mobile-menu d-flex flex-wrap align-items-end">
            <a href="#" title="" class="close-menu">
                <i class="fa fa-times"></i>
            </a>
            <ul class="mb-menu">
                <li><a class="active" href="#home">Home</a></li>
                <li><a href="#">Artists</a></li>
                <li><a href="#">Albums</a></li>
                <li><a href="#">Genre</a></li>
            </ul>

        </div>
        <section id="content">
            
            <section class="main-banner overlay">
                <div class="container">
                    <div class="banner-text text-center">
                        <h2>Your Favourite Songs <strong>At your Fingertips</strong></h2>
                        <p>For absolutely free</p>
                       
                    </div>
                </div>
            </section>


            <a href="#" title="" class="remove-music-player v2"><i class="fa fa-angle-up"></i></a>
            <div class="beatx-playyer fixed-player">
                <a href="#" title="" class="remove-music-player"><i class="fa fa-angle-down"></i></a>
                <div class="container-fluid">
                    <div id="jp_container_2" class="jp-audio" role="application" aria-label="media player">
                        <div class="jp-type-playlist">
                            <div class="jp-gui jp-interface align-items-center">
                                <div class="musicc-controls">
                                    <div class="row align-items-center">
                                        <div class="col-xl-4">
                                            <div class="song-title">
                                                <h2 class="jp-title"></h2>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-4">
                                            <div class="jp-controls d-flex flex-wrap align-items-center justify-content-end">
                                                <button class="jp-previous" role="button" tabindex="0"><i class="flaticon-backward-arrows-couple-pointing-to-left"></i></button>
                                                <button class="jp-play" role="button" tabindex="0"><i class="fa fa-play"></i></button>
                                                <button class="jp-next" role="button" tabindex="0"><i class="flaticon-fast-forward"></i></button>
                                            </div>
                                        </div>
                                        <div class="col-xl-5 col-lg-8 text-right">
                                            <div class="controls-sc">
                                                <div class="jp-progress">
                                                    <div class="jp-seek-bar">
                                                        <div class="jp-play-bar"></div>
                                                    </div>
                                                </div>
                                                <div class="jp-time-holder">
                                                    <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                                                    <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                                                </div>
                                                <div class="jp-toggles">
                                                    <button class="jp-repeat" role="button" tabindex="0"><i class="fa fa-redo-alt"></i></button>
                                                    <button class="jp-shuffle" role="button" tabindex="0"><i class="fa fa-random"></i></button>
                                                </div>
                                                <div class="jp-volume-controls">
                                                    <div class="jp-volume-bar">
                                                        <div class="jp-volume-bar-value"></div>
                                                    </div>
                                                    <button class="jp-mute" role="button" tabindex="0"><i class="fa fa-volume-up"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="jp-playlist">
                                <h3>Episodes</h3>
                                <ul>
                                    <li>&nbsp;</li>
                                </ul>
                            </div>
                            <div class="jp-no-solution">
                                <span>Update Required</span>
                                To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section class="block pb-0">
            <div class="container">
                <div class="podcast-series">
                    <div class="row" id="playlists" runat="server">

                    </div>
                </div>
            </section>

        </section>

        <section class="newsletter-sec">
            <div class="container">
                <div class="newsletter">
                    <div class="row align-items-center">
                        <div class="col-lg-5">
                            <div class="newz-txt">
                                <h3>Subscribe <span>Our Newsletter</span> To Receive the Latest News</h3>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="newsletter-form">
                                <div class="input-field">
                                    <span class="env"><i class="flaticon-email"></i></span>
                                    <input type="email" name="email" placeholder="Enter Your Email Address....">
                                    <button type="submit" class="btn-default">Subscribe <span></span></button>
                                </div>
                            </div><!--newsletter-form end-->
                        </div>
                    </div>
                </div><!--newsletter end-->
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
                        <!-- <div class="col-lg-3 col-md-6">
                            <div class="widget widget-links">
                                <ul class="wd-links">
                                    <li><a href="#" title="">Accessibility</a></li>
                                    <li><a href="#" title="">Contact</a></li>
                                    <li><a href="#" title="">Privacy and Cookie </a></li>
                                </ul>
                            </div>
                        </div> -->
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
                                <li><a href="index.html" title="">Help</a></li>
                                <li><a href="about.html" title="">About Us</a></li>
                                <li><a href="authors.html" title="">Authors</a></li>

                                <li><a href="#" title="">Press</a></li>
                                <li><a href="contact.html" title="">Contact</a></li>
                            </ul>
                            <p class="copyright-txt"><strong>BeatZ</strong> - Copyright 2021.</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <div id="jp_container_1" class="jp-audio fixed-player" role="application" aria-label="media player">
            <div class="jp-type-playlist">
                <div class="jp-gui jp-interface play-list-style">
                    <div class="album-img">
                        <img src="images/resources/album-img.jpg" alt="">
                    </div><!--album-img end-->
                    <div class="musicc-controls">
                        <div class="beatx-playyer">
                            <div id="jp_container_2" class="jp-audio" role="application" aria-label="media player">
                                <div class="jp-type-playlist">
                                    <div class="jp-gui jp-interface align-items-center">
                                        <div class="musicc-controls">
                                            <div class="row align-items-center">
                                                <div class="col-xl-12">
                                                    <div class="song-title">
                                                        <h2 class="jp-title"></h2>
                                                    </div>
                                                </div>
                                                <div class="col-xl-5 col-lg-5 col-md-5">
                                                    <div class="jp-controls d-flex flex-wrap align-items-center justify-content-start">
                                                        <button class="jp-previous" role="button" tabindex="0"><i class="flaticon-backward-arrows-couple-pointing-to-left"></i></button>
                                                        <button class="jp-play" role="button" tabindex="0"><i class="fa fa-play"></i></button>
                                                        <button class="jp-next" role="button" tabindex="0"><i class="flaticon-fast-forward"></i></button>
                                                    </div>
                                                </div>
                                                <div class="col-xl-7 col-lg-7 col-md-7 text-right">
                                                    <div class="controls-sc">
                                                        <div class="jp-progress">
                                                            <div class="jp-seek-bar">
                                                                <div class="jp-play-bar"></div>
                                                            </div>
                                                        </div>
                                                        <div class="jp-time-holder">
                                                            <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                                                            <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                                                        </div>
                                                        <div class="jp-toggles">
                                                            <button class="jp-repeat" role="button" tabindex="0"><i class="fa fa-redo-alt"></i></button>
                                                            <button class="jp-shuffle" role="button" tabindex="0"><i class="fa fa-random"></i></button>
                                                        </div>
                                                        <div class="jp-volume-controls">
                                                            <!-- <button class="jp-mute" role="button" tabindex="0"><i class="fa fa-volume-off"></i></button> -->
                                                            <div class="jp-volume-bar">
                                                                <div class="jp-volume-bar-value"></div>
                                                            </div>
                                                            <button class="jp-mute" role="button" tabindex="0"><i class="fa fa-volume-up"></i></button>
                                                            
                                                        </div>
                                                        <div class="jp-toggles">
                                                            <button id="playlist" class="fa fa-th-list" aria-hidden="true"></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="jp-playlist">
                                        <ul>
                                            <li>&nbsp;</li>
                                        </ul>
                                    </div>
                                    <div class="jp-no-solution">
                                        <span>Update Required</span>
                                        To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                                    </div>
                                </div>
                            </div>
                        </div><!--beatx-music-player end-->
                    </div>
                </div>
                <div class="jp-playlist">
                    <ul>
                        <li>&nbsp;</li>
                    </ul>
                </div>
                <div class="jp-no-solution">
                    <span>Update Required</span>
                    To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                </div>
            </div>
        </div>
    </div>
    <script src="js/all.min.js?version=4"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/sammy.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    
	<script type="text/javascript" charset="utf-8">
	    $(document).ready(function() {
		    $('#example').DataTable(
			     {    
		      "aLengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]],
			    "iDisplayLength": 5
		       } 
			    );
	    } );
	    $(document).on('click',"#togglebutton",function(){
	        $("#play").toggleClass("fa-play");
	        $("#play").toggleClass("fa-pause");
	    });
	
	
	    function checkAll(bx) {
	      var cbs = document.getElementsByTagName('input');
	      for(var i=0; i < cbs.length; i++) {
		    if(cbs[i].type == 'checkbox') {
		      cbs[i].checked = bx.checked;
		    }
	      }
	    }
        $(".jp-playlist").slideToggle();
        $("#playlist").click(function () {
            $(".jp-playlist").slideToggle();
        });
    </script>

    <script type="text/javascript" charset="utf-8">
        

        (function($) {
            let playlist;
            $.ajax({
                url: 'music_queue.aspx/getQueue',
                method:'post',
                contentType: 'application/json',
                dataType: 'json',
                success:function(data){
                    console.log(data);
                    queue = [];
                    for (let i in data['d']){
                        queue.push({
                            title: data['d'][i]["title"],
                            mp3: data['d'][i]["mp3"],
                            oga: data['d'][i]["oga"],
                        })
                    }
                    console.log(queue);
                    playlist = new jPlayerPlaylist({
                        jPlayer: "#jquery_jplayer_1",
                        cssSelectorAncestor: "#jp_container_1"
                    }, queue, {
                        swfPath: "js/jplayer",
                        supplied: "mp3",
                        wmode: "window",
                        useStateClassSkin: !0,
                        autoBlur: !1,
                        smoothPlayBar: !0,
                        keyEnabled: !0
                    })
                }
            })
			var app = $.sammy(function() {

			    this.get('#/', function() {
			        $("#content").load("home.aspx");
				});

				this.get('#/home', function() {
					$("#content").load("home.aspx");

				});
				this.get('#/playlist/:id', function (context) {
				    $.ajax({
				        url: "/playlist_list.aspx?playlist=" + context.params.id,
				        success: function (res) {
				            $("#content").html(res);
				            $(".play_playlist").on('click', function () {
				                $.ajax({
				                    url: 'music_queue.aspx/getPlaylistQueue',
				                    method: 'post',
				                    contentType: 'application/json',
				                    dataType: 'json',
				                    data: '{playlist_id:' + $(this).data("playlist") + '}',
				                    success: function (data) {
				                        queue = [];
				                        for (let i in data['d']) {
				                            queue.push({
				                                title: data['d'][i]["title"],
				                                mp3: data['d'][i]["mp3"],
				                                oga: data['d'][i]["oga"],
				                            })
				                        }
				                        playlist.setPlaylist(queue);
				                    }
				                })
				            });
				            $(".play_music").on('click', function () {
				                $.ajax({
				                    url: 'music_queue.aspx/getMusicQueue',
				                    method: 'post',
				                    contentType: 'application/json',
				                    dataType: 'json',
				                    data: '{music_id:' + $(this).data("music") + '}',
				                    success: function (data) {

				                        playlist.setPlaylist([{
				                            title: data['d']["title"],
				                            mp3: data['d']["mp3"],
				                            oga: data['d']["oga"],
				                        }]);
				                    }
				                })
				            });
				        }
				    })

				});
				this.get('#/create_playlist', function() {
				    $("#content").load("create_playlist.aspx");
                    
				    $(document).on('click', "#submit", function(){
				        let cb = $(".music");
				        let name = $("#playlist_name").val();
				        let user_id = $("#user_id").val();
				        let ar = [];
				        let j = 0 ;
				        for(let i = 0;i <cb.length;i++){
				            if (cb[i].checked){
				                ar[j] = cb[i].value;
				                j++;
				            }
				        }
				        $.ajax({
				            url: 'create_playlist.aspx/savePlaylist',
				            method:'post',
				            contentType: 'application/json',
				            data: '{name:"' + name + '", id:"' + ar.join("-") + '", user_id:' + user_id + '}',
				            dataType: 'json',
				            success:function(data){
				                console.log(data)
				                if(data['d']== null){
				                    window.location.hash = "/user_playlist";
				                }
				            }
				        })
				    })
				});
				this.get('#/user_playlist', function() {
				    $("#content").load("user_playlist.aspx");

				});
                
				this.get('#/user_playlist/:id', function(context) {
				    $.ajax({
				        url: "/user_playlist_list.aspx?playlist=" + context.params.id,
				        success:function(res){
				            $("#content").html(res);
				            $(".play_playlist").on('click', function(){
				                $.ajax({
				                    url: 'music_queue.aspx/getUserPlaylistQueue',
				                    method:'post',
				                    contentType: 'application/json',
				                    dataType: 'json',
				                    data: '{playlist_id:' + $(this).data("playlist") + '}',
				                    success:function(data){
				                        queue = [];
				                        for (let i in data['d']){
				                            queue.push({
				                                title: data['d'][i]["title"],
				                                mp3: data['d'][i]["mp3"],
				                                oga: data['d'][i]["oga"],
				                            })
				                        }
				                        playlist.setPlaylist(queue);
				                    }
				                })
				            });
				            $(".play_music").on('click', function(){
				                $.ajax({
				                    url: 'music_queue.aspx/getMusicQueue',
				                    method:'post',
				                    contentType: 'application/json',
				                    dataType: 'json',
				                    data: '{music_id:' + $(this).data("music") + '}',
				                    success:function(data){
				                        
				                        playlist.setPlaylist([{
				                            title: data['d']["title"],
				                            mp3: data['d']["mp3"],
				                            oga: data['d']["oga"],
				                        }]);
				                    }
				                })
				            });
				        }
				    })

				});
				this.get('#/genre', function() {
				    $("#content").load("genre.aspx");

				});
				this.get('#/genre/:id', function(context) {
					console.log(context.params.id);
					$.ajax({
					    url: "/genre_list.aspx?genre=" + context.params.id,
					    success:function(res){
					        $("#content").html(res);
					        $(".play_playlist").on('click', function(){
					            $.ajax({
					                url: 'music_queue.aspx/getGenrePlaylistQueue',
					                method:'post',
					                contentType: 'application/json',
					                dataType: 'json',
					                data: '{genre_id:' + $(this).data("playlist") + '}',
					                success:function(data){
					                    queue = [];
					                    for (let i in data['d']){
					                        queue.push({
					                            title: data['d'][i]["title"],
					                            mp3: data['d'][i]["mp3"],
					                            oga: data['d'][i]["oga"],
					                        })
					                    }
					                    playlist.setPlaylist(queue);
					                }
					            })
					        });
					        $(".play_music").on('click', function(){
					            $.ajax({
					                url: 'music_queue.aspx/getMusicQueue',
					                method:'post',
					                contentType: 'application/json',
					                dataType: 'json',
					                data: '{music_id:' + $(this).data("music") + '}',
					                success:function(data){
				                        
					                    playlist.setPlaylist([{
					                        title: data['d']["title"],
					                        mp3: data['d']["mp3"],
					                        oga: data['d']["oga"],
					                    }]);
					                    playlist.play();
					                }
					            })
					        });
					    }
					})

				});
				this.get('#/album', function() {
				    $("#content").load("album.aspx");

				});
				this.get('#/album/:id', function(context) {
				    console.log(context.params.id);
				    $.ajax({
				        url: "/album_list.aspx?album=" + context.params.id,
				        success:function(res){
				            $("#content").html(res);
				            $(".play_playlist").on('click', function(){
				                $.ajax({
				                    url: 'music_queue.aspx/getAlbumPlaylistQueue',
				                    method:'post',
				                    contentType: 'application/json',
				                    dataType: 'json',
				                    data: '{album_id:' + $(this).data("playlist") + '}',
				                    success:function(data){
				                        queue = [];
				                        for (let i in data['d']){
				                            queue.push({
				                                title: data['d'][i]["title"],
				                                mp3: data['d'][i]["mp3"],
				                                oga: data['d'][i]["oga"],
				                            })
				                        }
				                        playlist.setPlaylist(queue);
				                    }
				                })
				            });
				            $(".play_music").on('click', function(){
				                $.ajax({
				                    url: 'music_queue.aspx/getMusicQueue',
				                    method:'post',
				                    contentType: 'application/json',
				                    dataType: 'json',
				                    data: '{music_id:' + $(this).data("music") + '}',
				                    success:function(data){
				                        
				                        playlist.setPlaylist([{
				                            title: data['d']["title"],
				                            mp3: data['d']["mp3"],
				                            oga: data['d']["oga"],
				                        }]);
				                        playlist.play();
				                    }
				                })
				            });
				        }
				    })

				});
                
				this.get('#/artist', function() {
				    $("#content").load("artist.aspx");

				});
				this.get('#/artist/:id', function(context) {
				    console.log(context.params.id);
				    $.ajax({
				        url: "/artist_list.aspx?artist=" + context.params.id,
				        success:function(res){
				            $("#content").html(res);
				            $(".play_playlist").on('click', function(){
				                $.ajax({
				                    url: 'music_queue.aspx/getArtistPlaylistQueue',
				                    method:'post',
				                    contentType: 'application/json',
				                    dataType: 'json',
				                    data: '{artist_id:' + $(this).data("playlist") + '}',
				                    success:function(data){
				                        queue = [];
				                        for (let i in data['d']){
				                            queue.push({
				                                title: data['d'][i]["title"],
				                                mp3: data['d'][i]["mp3"],
				                                oga: data['d'][i]["oga"],
				                            })
				                        }
				                        playlist.setPlaylist(queue);
				                    }
				                })
				            });
				            $(".play_music").on('click', function(){
				                $.ajax({
				                    url: 'music_queue.aspx/getMusicQueue',
				                    method:'post',
				                    contentType: 'application/json',
				                    dataType: 'json',
				                    data: '{music_id:' + $(this).data("music") + '}',
				                    success:function(data){
				                        
				                        playlist.setPlaylist([{
				                            title: data['d']["title"],
				                            mp3: data['d']["mp3"],
				                            oga: data['d']["oga"],
				                        }]);
				                        playlist.play();
				                    }
				                })
				            });
				        }
				    })

				});
			});

			$(function() {
				app.run()
			});
		})(jQuery);

		
		

    </script>
</body>

</html>

