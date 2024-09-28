using System;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Remoting.Messaging;
using System.Web.UI.WebControls;

namespace Funcionarios
{
    public partial class Funcionarios : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-SUU6P5E;Initial Catalog=Funcionarios;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarFuncionarios();
                PopularDropDownListCargos();
            }
        }

        public void MostrarFuncionarios()
        {
            try
            {
                string sqlQuery = "EXEC ListarPessoas";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridViewList.DataSource = dt;
                GridViewList.DataBind();

                con.Close();
            }
            catch (SqlException ex)
            {
                MessageLbl.Text = "Existe um problema na listagem de funcionários: " + ex.Message.ToString();
            }
        }

        public void PopularDropDownListCargos()
        {
            try
            {
                string sqlQuery = "EXEC ListarCargos";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlDataReader sdr = cmd.ExecuteReader();
                ddlCargos.DataSource = sdr;
                ddlCargos.DataTextField = "Nome";
                ddlCargos.DataValueField = "ID";
                ddlCargos.DataBind();

                ddlCargos.Items.Insert(0, new ListItem("-- Selecione um Cargo --", "0"));

                con.Close();
            }
            catch (SqlException ex)
            {
                MessageLbl.Text = "Existe um problema na listagem de cargos: " + ex.Message.ToString();
            }
        }

        protected void ddlCargos_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlCargos.SelectedValue != "0")
                {
                    int cargoId = Convert.ToInt32(ddlCargos.SelectedValue);

                    string sqlQuery = "SELECT Salario FROM Cargo WHERE ID = @CargoID";
                    SqlCommand cmd = new SqlCommand(sqlQuery, con);

                    cmd.Parameters.AddWithValue("@CargoID", cargoId);

                    if (con.State == ConnectionState.Closed)
                        con.Open();

                    object salario = cmd.ExecuteScalar();

                    if (salario != null)
                    {
                        salarioBox.Text = Convert.ToDecimal(salario).ToString("F2");
                    }
                    else
                    {
                        salarioBox.Text = string.Empty;
                    }

                    con.Close();
                }
                else
                {
                    salarioBox.Text = string.Empty;
                }
            }
            catch (SqlException ex)
            {
                MessageLbl.Text = "Existe um problema na definição de salário: " + ex.Message.ToString();
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {

        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewList_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}