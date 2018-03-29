<%@ Page Title="Contact us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Info.Contact" %>

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

    <h2><%: Title %>.</h2>
    <h3>Sardar Vallabhbhai Patel Institute of Technology</h3>
    <address>
        Sardar Vallabhbhai Patel Institute of Technology<br />
        Vasad - 388306<br />
        <abbr title="Phone">P:</abbr>
        +91 2692 274766
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:svit_vasadgen@rediffmail.com">svit_vasadgen@rediffmail.com</a><br />
    </address>
    <div id="googleMap" style="height:400px;width:100%;"></div>

        <!-- Add Google Maps -->
        <script src="http://maps.googleapis.com/maps/api/js"></script>
        <script>
            var myCenter = new google.maps.LatLng(22.4683865, 73.0763135);

        function initialize() {
        var mapProp = {
          center:myCenter,
          zoom:11,
          scrollwheel:false,
          draggable:false,
          mapTypeId:google.maps.MapTypeId.ROADMAP
          };

        var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

        var marker = new google.maps.Marker({
          position:myCenter,
          });

        marker.setMap(map);
        }

        google.maps.event.addDomListener(window, 'load', initialize);
        </script>

</asp:Content>
