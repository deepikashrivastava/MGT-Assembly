﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMGT.master" AutoEventWireup="true" CodeFile="svC27.aspx.cs" Inherits="svC27" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row text-center" style="font-family:Verdana">C-27 GANTT CHART</div>
    <div class="row text-right" style="margin-right:100px;"><a href="svAssembly.aspx">BACK</a></div>
    <br />
    <br />
    <div class="row jumbotron">
        <asp:Table runat="server" ID="tc27" CellPadding="1" CssClass="center-block table-responsive table-hover" style="margin-left:150px;margin-right:150px" BorderWidth="0">
            <asp:TableHeaderRow ID="thr" BorderWidth="0" BackColor="Black" ForeColor="White">
                <asp:TableHeaderCell ID="mach" BorderWidth="1">MACHINE</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="job" BorderWidth="1">JOB ID</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="cust" BorderWidth="1">CUSTOMER</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </div>
    <asp:SqlDataSource ID="sdcph" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [phase] ORDER BY [phaseORDER] ASC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcmac" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [machine] ORDER BY [locationID]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdloc" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [location] WHERE ([assembly] = @assembly)">
        <SelectParameters>
            <asp:Parameter DefaultValue="c27" Name="assembly" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcfin" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [finished] ORDER BY [timestamp] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdcjob" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [job] WHERE ([over] = @over)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="over" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdccust" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsplan" runat="server" ConnectionString='<%$ ConnectionStrings:automationConnectionString %>' SelectCommand="SELECT * FROM [plan] WHERE ([job] = @job) ORDER BY [phase]">
        <SelectParameters>
            <asp:ControlParameter ControlID="hjob" PropertyName="Value" Name="job" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hjob" runat="server" />

</asp:Content>

