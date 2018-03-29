<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Info.Student.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/style.css" rel="stylesheet" type="text/css" />
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <li>
                <asp:Image runat="server" ID="ProfilePicsThumb" Height="50px" Width="50px" CssClass="img-circle" /></li>
            <li><a runat="server" href="Profile"><%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
            <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
            <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    <div>
        <div class="jumbotron">
            <div class="col-md-* text-center">
                <asp:Image ID="ProfilePicture" runat="server" CssClass="img-circle" Height="200px" Width="200px" />
                <h1><%=HttpContext.Current.Session["FirstName"]%>&nbsp;<%=HttpContext.Current.Session["LastName"]%></h1>
            </div>
        </div>

        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#PersonalDetails" role="tab">Home</a></li>
                <li><a data-toggle="tab" href="#GradeHistory" role="tab">Grade History</a></li>
                <li><a data-toggle="tab" href="#Attendance" role="tab">Attendance</a></li>
                <li><a data-toggle="tab" href="#Downloads" role="tab">Downloads</a></li>
            </ul>
        </div>


        <div class="tab-content">
            <div id="PersonalDetails" class="tab-pane fade in active">
                <div class="row">
                    <div class="col-md-4 text-center">
                        <h2>First Name</h2>
                        <h3 id="FirstName" runat="server" />
                    </div>
                    <div class="col-md-4 text-center">
                        <h2>Middle Name</h2>
                        <h3 id="MiddleName" runat="server" />
                    </div>
                    <div class="col-md-4 text-center">
                        <h2>Last Name</h2>
                        <h3 id="LastName" runat="server" />
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-4 text-center">
                        <h2>Enrolment No.</h2>
                        <h3 id="UserID" runat="server" />
                    </div>
                    <div class="col-md-4 text-center">
                        <h2>Department</h2>
                        <h3 id="Department" runat="server" />
                    </div>
                    <div class="col-md-4 text-center">
                        <h2>Current Semester</h2>
                        <h3 id="CurrentSemester" runat="server" />
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-4 text-center">
                        <h2>Contact:Parent</h2>
                        <h3 id="Contact_P" runat="server" />
                    </div>
                    <div class="col-md-4 text-center">
                        <h2>Contact:Self</h2>
                        <h3 id="Contact_S" runat="server" />
                    </div>
                    <div class="col-md-4 text-center">
                        <h2>Email</h2>
                        <h3 id="Email" runat="server" />
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2>Address</h2>
                        <h3 id="Address" runat="server" />
                    </div>
                </div>
            </div>
            <div id="GradeHistory" class="tab-pane fade">
                <div class="col-md-12 text-center">
                    <asp:Panel runat="server" ID="Result" />
                </div>
            </div>
            <div id="Attendance" class="tab-pane fade">
                <br />
                <div class="col-md-12 text-center">
                    <div class="col-md-offset-1 col-md-10 text-center">
                        <div class="progress">
                            <div class="progress-bar progress-bar-info" id="AttendanceStatusOverall" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                <p id="p0" runat="server" />
                            </div>
                        </div>
                        <div class="progress" id="Div1" runat="server" visible="false">
                            <div class="progress-bar progress-bar-success" id="Sub1" visible="false" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                <p id="p1" runat="server" />
                            </div>
                        </div>
                        <div class="progress" id="Div2" runat="server" visible="false">
                            <div class="progress-bar progress-bar-success" id="Sub2" visible="false" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                <p id="p2" runat="server" />
                            </div>
                        </div>
                        <div class="progress" id="Div3" runat="server" visible="false">
                            <div class="progress-bar progress-bar-success" id="Sub3" visible="false" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                <p id="p3" runat="server" />
                            </div>
                        </div>
                        <div class="progress" id="Div4" runat="server" visible="false">
                            <div class="progress-bar progress-bar-success" id="Sub4" visible="false" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                <p id="p4" runat="server" />
                            </div>
                        </div>
                        <div class="progress" id="Div5" runat="server" visible="false">
                            <div class="progress-bar progress-bar-success" id="Sub5" visible="false" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                <p id="p5" runat="server" />
                            </div>
                        </div>
                        <div class="progress" id="Div6" runat="server" visible="false">
                            <div class="progress-bar progress-bar-success" id="Sub6" visible="false" runat="server" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                <p id="p6" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div id="Downloads" class="tab-pane fade">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6">
                            <p>Generate your Bonafide certificate by following simple steps.</p>
                            <p><a class="btn btn-default" href="Report/Bonafide">Click here &raquo;</a></p>
                        </div>
                        <div class="col-md-6">
                            <p>Generate your Grade History Report Here.</p>
                            <p><a class="btn btn-default" href="Report/Marksheet">Click here &raquo;</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
