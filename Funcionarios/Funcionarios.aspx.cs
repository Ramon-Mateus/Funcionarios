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

        public void PopularInputs(string ID)
        {
            try
            {
                string sqlQuery = "EXEC SelecionarPessoa @ID";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@ID", ID);

                if (con.State == ConnectionState.Closed)
                    con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    pessoaIdBox.Text = rdr.GetValue(0).ToString();
                    NomeBox.Text = rdr.GetValue(1).ToString();
                    cidadeBox.Text = rdr.GetValue(2).ToString();
                    emailBox.Text = rdr.GetValue(3).ToString();
                    cepBox.Text = rdr.GetValue(4).ToString();
                    EnderecoBox.Text = rdr.GetValue(5).ToString();
                    paisBox.Text = rdr.GetValue(6).ToString();
                    usuarioBox.Text = rdr.GetValue(7).ToString();
                    telefoneBox.Text = rdr.GetValue(8).ToString();
                    dataNascimentoBox.Text = Convert.ToDateTime(rdr.GetValue(9)).ToString("yyyy-MM-dd");
                    ddlCargos.SelectedValue = rdr.GetValue(10).ToString();
                    salarioBox.Text = Convert.ToDecimal(rdr.GetValue(11)).ToString("N2");
                }

                con.Close();
            }
            catch (SqlException ex)
            {
                MessageLbl.Text = "Existe um problema populando os inputs: " + ex.Message.ToString();
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
                        salarioBox.Text = Convert.ToDecimal(salario).ToString("N2");
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
            if (e.CommandName == "ViewDetails")
            {
                string ID = e.CommandArgument.ToString();
                PopularInputs(ID);
            }
        }
    }
}