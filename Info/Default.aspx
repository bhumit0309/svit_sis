<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Info.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            <li data-target="#carousel-example-generic" data-slide-to="5"></li>
            
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="../Slider/1.jpg" alt="">
                <div class="carousel-caption">
                    
                </div>
            </div>
            <div class="item">
                <img src="../Slider/2.jpg" alt="">
                <div class="carousel-caption">
                    
                </div>
            </div>
            <div class="item">
                <img src="../Slider/3.jpg" alt="">
                <div class="carousel-caption">
                    
                </div>
            </div>
            <div class="item">
                <img src="../Slider/4.jpg" alt="">
                <div class="carousel-caption">
                    
                </div>
            </div>
            <div class="item">
                <img src="../Slider/5.jpg" alt="">
                <div class="carousel-caption">
                    
                </div>
            </div>
            <div class="item">
                <img src="../Slider/6.jpg" alt="">
                <div class="carousel-caption">
                    
                </div>
            </div>
            
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h2>Getting started</h2>
            <p>
                The Student will be registered by the Administrator only. So kindly contact Administrator department for your User ID and Password.
            </p>
            <p>
                <a class="btn btn-default" href="Contact">Contact us &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Already Registered?</h2>
            <p>
                You can easily Login to your acount by simply using your User ID and Password Provided by Administrator.
            </p>
            <p>
                <a class="btn btn-default" href="Account/Login">Login Here &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
