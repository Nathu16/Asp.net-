using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace _2tfinalconnectivity
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        String s = ConfigurationManager.ConnectionStrings["dbconnect"].ToString();
        String fnm, h1, h2, h3;
        String[] hb = new String[3];

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edit")
            {
                int Id = Convert.ToInt16(e.CommandArgument);
                ViewState["Id"] = Id;
                filltext();
                Submit.Text = "update";
            }

            else
            {
                cmd = new SqlCommand("delete from PersonalDetails where " + "Id = '" + ViewState["Id"] + "'", con);
                cmd.ExecuteNonQuery();
                Fillgrid();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)  // Ensure this matches exactly
        {

            Hobbie();
            getcon();

            for (int i = 0; i < 1; i++)
            {
                if (hb[i] == "Cricket")
                {
                    h1 = "Cricket";
                    i++;
                }
                else
                {
                    h1 = "null";
                    i++;
                }
                if (hb[i] == "vollyball")
                {
                    h2 = "vollyball";
                    i++;
                }
                else
                {
                    h2 = "null";
                    i++;
                }
                if (hb[i] == "football")
                {
                    h3 = "football";
                    i++;
                }
                else
                {
                    h3 = "null";
                    i++;
                }
            }

            cmd = new SqlCommand("INSERT INTO [PersonalDetails] (Name,Gender,Hobby1,Hobby2,Hobby3,City,Address,Country) " +
                "VALUES ('" + txtunm.Text + "','" + rdbgen.Text + "','" + h1 + "','" + h2 + "','" + h3 + "','" +
                txtcity.Text + "','" + txtadd.Text + "','" + ddlcountry.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        void getcon()
        {
            con = new SqlConnection(s);
            
            con.Open();
        }

        void Hobbie()
        {
            for (int i = 0; i < hb.Length; i++)
            {
                if (Chkhb.Items[i].Selected == true)
                {
                    hb[i] = Chkhb.Items[i].Text;
                }
            }
        }
        void Fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from PersonalDetails", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }


        void empty()
        {
            txtunm.Text = "";
            rdbgen.ClearSelection();
            Chkhb.ClearSelection();
            ddlcountry.ClearSelection();
            txtadd.Text = "";
            Submit.Text = "Save";
        }

        public DataSet Select(int Id)
        {
            getcon();
            Hobbie();

            da = new SqlDataAdapter("select*from PersonalDetails where Id='" + Id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }



        void filltext()
        {
            getcon();
            ds = new DataSet();
            ds = Select(Convert.ToInt16(ViewState["Id"]));
            txtunm.Text = ds.Tables[0].Rows[0][1].ToString();
            txtadd.Text = ds.Tables[0].Rows[0][7].ToString();
            rdbgen.Text = ds.Tables[0].Rows[0][2].ToString();
            ddlcountry.SelectedValue = ds.Tables[0].Rows[0][8].ToString();

            if (ds.Tables[0].Rows[0][3].ToString() == "Cricket")
            {
                Chkhb.Items[0].Selected = true;
            }
            else
            {
                Chkhb.Items[0].Selected = false;
            }

            if (ds.Tables[0].Rows[0][4].ToString() == "vollyball")
            {
                Chkhb.Items[1].Selected = true;
            }
            else
            {
                Chkhb.Items[1].Selected = false;
            }

            if (ds.Tables[0].Rows[0][5].ToString() == "Football")
            {
                Chkhb.Items[2].Selected = true;
            }
            else
            {
                Chkhb.Items[2].Selected = false;
            }
        }

    }
}