<%@ Page Title="Listagem de funcionários" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Funcionarios.aspx.cs" Inherits="Funcionarios.Funcionarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div class="form-group text-center">
            <asp:Label ID="MessageLbl" runat="server" Text=""></asp:Label>
        </div>


        <asp:GridView ID="GridViewList" runat="server" CssClass="table" AutoGenerateColumns="False">
            <Columns>

                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="Pessoa" HeaderText="Nome" />
                <asp:BoundField DataField="Cidade" HeaderText="Cidade" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="CEP" HeaderText="CEP" />
                <asp:BoundField DataField="Endereco" HeaderText="Endereço" />
                <asp:BoundField DataField="Pais" HeaderText="País" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuário" />
                <asp:BoundField DataField="Telefone" HeaderText="Telefone" />
                <asp:BoundField DataField="Data_Nascimento" HeaderText="Data de Nascimento" />
                <asp:BoundField DataField="Cargo" HeaderText="Cargo" />
                <asp:BoundField DataField="Salario" HeaderText="Salário" />

                <%--<asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-primary" CommandName="ViewDetails" CommandArgument='<%# Bind("emp_id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
        </asp:GridView>
    </main>

</asp:Content>
