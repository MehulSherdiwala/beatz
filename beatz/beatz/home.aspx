<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="beatz.home" %>


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
