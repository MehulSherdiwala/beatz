<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="album.aspx.cs" Inherits="beatz.album" %>
<section class="block pt-0" style="padding: 0%;">
    <section class="pager-section">
        <div class="fixed-bg pager-bg"></div>
        <div class="container">
            <div class="pager-details text-center">
                <h2 class="page-title">Album</h2>
                <ul class="breadcrumb">
                    <li><a href="#" title="">Home</a></li>
                    <li><span>Album</span></li>
                </ul><!--breadcrumb end-->
            </div><!--pager-details end-->
        </div>
    </section>
    <section class="block pb-0">
        <div class="container">

            <div class="podcast-series">
                <div class="row" id="album_list" runat="server">

                </div>
            </div>
        </div>
    </section>
</section>
