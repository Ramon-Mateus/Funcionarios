using System;
using System.Data;
using System.Data.SqlClient;

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
            }
        }

        public void MostrarFuncionarios()
        {
            try
            {
                String sqlQuery = "EXEC ListarPessoas";
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
    }
}