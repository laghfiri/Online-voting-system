﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["uid"] != null)
        {
            string msg = "You have successfully registered " + Request.QueryString["uid"].ToString() + ". Please Login.";
            Label1.Text = msg;
        }
        else
            Label1.Text = null;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string str = ConfigurationManager.ConnectionStrings["votingdatabase"].ToString();
        con = new SqlConnection(str);
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from Voters where name='" + username.Value + "'", con);


        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            if (password.Value.ToString() == dr.GetString(9) && password.Value.ToString()!="admin")
            {
                FormsAuthentication.SetAuthCookie(username.Value, true);

                Response.Redirect("Elections.aspx");

            }
            else if (password.Value.ToString() == "admin")
                Response.Redirect("admin.aspx");
            else 
            {
                Label1.Text = "Wrong Password! Try again.";
            }
        }
        else
        {
            Label1.Text = "No user with this Username found.";
        }
       


        con.Close();
    }
   

    
}