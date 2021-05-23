<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create_playlist.aspx.cs" Inherits="beatz.create_playlist" %>
<section id="content">
	<section class="">
		<div class="pod-info">
			<h3 style="text-align: center;">Create your Playlist</h3>
		</div>
	</section>
</section>
<section class="p-1">
	<div class="container">
		<div class="contact-page">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact-page-form">
						<div class="post-comments">
							<form method="get" action="#" id="contact-form">
								<div class="response"></div>
								<div class="row">
									<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<input type="text" id="playlist_name" name="name" class="form-control name" placeholder="Playlist title">
                                            <input type="hidden" id="user_id" value="<%= Session["user_id"] %>" />
										</div><!--form-group end-->
									</div>
									<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
										<div class="">
											<table id="example" class="table table-striped table-bordered" style="width:100%">
												<thead>
													<tr>
														<th><input type="checkbox" onclick="checkAll(this)"></th>
														<th>Name</th>
														<th>Artist</th>
													</tr>
												</thead>
												<tbody id="table" runat="server">
													<tr>
														<td><input type="checkbox" name=""></td>
														<td>Lut gaye</td>
																
														<td>Shreya ghoshal,Jubin Nautiyal</td>
													</tr>
													<tr>
															<td><input type="checkbox" name=""></td>
														<td>Tera Chehra</td>
														<td>Adnan Sami</td>
															
													</tr>
													
											</tbody>
										</table>
										</div><!--form-group end-->
									</div>
									<div class="col-lg-offset-2 col-md-12">
										<div class="form-group m-0">
											<button type="button" class="btn-default" id="submit">Submit <span></span></button>
										</div><!--form-group end-->
									</div>
								</div>
							</form>
						</div>
					</div><!--contact-page-form end-->
				</div>
			</div>
					
		</div><!--contact-page end-->
	</div>
</section>