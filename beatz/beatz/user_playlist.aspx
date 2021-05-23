﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_playlist.aspx.cs" Inherits="beatz.user_playlist" %>

<section class="block pt-0" style="padding: 0%;">
    <section class="pager-section">
        <div class="fixed-bg pager-bg"></div>
        <div class="container">
            <div class="pager-details text-center">
                <h2 class="page-title">Playlist</h2>
                <ul class="breadcrumb">
                    <li><a href="#" title="">Home</a></li>
                    <li><span>Playlist</span></li>
                </ul><!--breadcrumb end-->
            </div><!--pager-details end-->
        </div>
    </section>
    <section class="block pb-0">
        <div class="container">

            <div class="podcast-series">
                <div class="row" id="user_list" runat="server">

                </div>
            </div>
        </div>
    </section>
</section>
