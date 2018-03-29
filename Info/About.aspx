<%@ Page Title="About us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Info.About" %>

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
    <div class="col-md-12">
        
        <ul style="list-style-type:disc; font-size: inherit; padding-bottom: 10px">
            <li class="listpadding"> A single large piece of 26 acres of land is owned by the New English School Trust, Vasad on which the SVIT building are constructed and sufficient land is available for further development.</li>
            <li class="listpadding"> Total Eight Degree Engineering Branches offered at SVIT under Gujarat Technological university, Four Postgraduate Programmes & Department for Master of Computer Applications.</li>
            <li class="listpadding"> Apart from regular facilities of classrooms, laboratories, workshops, conference hall and staff rooms. SVIT provides for its students canteen, bank counter, stationary store, telephone booths, photocopiers etc.</li>
            <li class="listpadding"> An independent library with an extensive range of over 18441 books, and subscription of about 154 periodicals and journals.</li>
            <li class="listpadding"> Career guidance programmes and placement of outgoing students are effectively looked after by the Training & Placement.</li>
            <li class="listpadding"> Lectures delivered by experts under the TECHSAT program(organized by Gujarat Council of Science and Technology GUJCOST) are received by satellite communication.</li>
            <li class="listpadding"> For Conducting activities such as industrial visits, in-plant training, sports, computer training, technical presentations(with LCD/multimedia projector), communication skills, development, etc.</li>
            <li class="listpadding"> A computer center with 1 mbps internet micro-wave link and an intranet using Linux and Windows NT(Novel Netware) as OS.</li>
            <li class="listpadding"> A forum called Edge-U-Cator gives opportunities to students for bringing out their talent in public speaking, knowledge of current affairs, etc.</li>
            <li class="listpadding"> Bus facilities are available for students commuting from Baroda, Anand and Ahmedabad to SVIT and back.</li>
            <li class="listpadding"> A well-knit alumni association for students to ensures bondage among the Student fraternity.</li>
            <li class="listpadding"> Hostels-Both NEST and SVIT help and guide every student for residential accommodation; NEST has made separate arrangements for female students.</li>
            <li class="listpadding"> Literacy and Debating Society conducts programmes for overall development of students and enhancing their skills through debates, elocution, quizzes and other similar in-house activities.</li>
            <li class="listpadding"> Workshop kit storage arrangement is made to save money and botheration to carry it daily to workshop and home.</li>
        </ul>
            
    </div>
</asp:Content>
