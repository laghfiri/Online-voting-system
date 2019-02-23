﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editElections.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="editElections" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
            <h4><strong>EDIT ELECTIONS </strong></h4>
            <div class="row">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="starttime" HeaderText="Start" SortExpression="starttime" />
                <asp:BoundField DataField="endtime" HeaderText="End" SortExpression="endtime" />
                <asp:BoundField DataField="descriptionelection" HeaderText="Description" SortExpression="descriptionelection" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=votingdatabase;Integrated Security=True" ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT [id], [title], [starttime], [endtime], [descriptionelection] FROM [elections]"
            UpdateCommand = "UPDATE elections SET title = @title, starttime = @starttime, endtime = @endtime, descriptionelection = @descriptionelection where id = @id"
            DeleteCommand ="DELETE from elections where id = @id">

            <UpdateParameters>
                <asp:Parameter Name="title"/>
                <asp:Parameter Name="starttime" />
                <asp:Parameter Name="endtime"/>
                <asp:Parameter Name="descriptionelection"/>
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="id"/>
            </DeleteParameters>
        </asp:SqlDataSource>
            </div>
        </div>

   </asp:Content>