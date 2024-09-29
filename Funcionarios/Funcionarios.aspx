<%@ Page Title="Listagem de funcionários" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Funcionarios.aspx.cs" Inherits="Funcionarios.Funcionarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <h1 class="text-center">Listagem de funcionários</h1>
        <p class="text-center">&nbsp;</p>

        <div class="form-group text-center">
            <asp:Label ID="MessageLbl" runat="server" Text=""></asp:Label>
        </div>

        <div class="form-group row">
            <asp:Panel ID="Panel6" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label6" runat="server" Text="Funcionário Id"></asp:Label>
                <asp:TextBox ID="pessoaIdBox" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel1" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label1" runat="server" Text="Nome"></asp:Label>
                <asp:TextBox ID="NomeBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label2" runat="server" Text="Cidade"></asp:Label>
                <asp:TextBox ID="cidadeBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel7" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="emailBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
        </div>

        <div class="form-group row">
            <asp:Panel ID="Panel3" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label3" runat="server" Text="CEP"></asp:Label>
                <asp:TextBox ID="cepBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel5" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label5" runat="server" Text="Endereço"></asp:Label>
                <asp:TextBox ID="EnderecoBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel9" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label9" runat="server" Text="País"></asp:Label>
                <asp:TextBox ID="paisBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel8" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label8" runat="server" Text="Usuário"></asp:Label>
                <asp:TextBox ID="usuarioBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>
        </div>

        <div class="form-group row mb-3">
            <asp:Panel ID="Panel10" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label10" runat="server" Text="Telefone"></asp:Label>
                <asp:TextBox ID="telefoneBox" runat="server" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel11" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label11" runat="server" Text="Data de Nascimento"></asp:Label>
                <asp:TextBox ID="dataNascimentoBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel4" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label4" runat="server" Text="Cargo"></asp:Label>
                <asp:DropDownList ID="ddlCargos" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCargos_SelectedIndexChanged"></asp:DropDownList>
            </asp:Panel>

            <asp:Panel ID="Panel12" runat="server" CssClass="form-group col-md-2">
                <asp:Label ID="Label12" runat="server" Text="Salário (R$)"></asp:Label>
                <asp:TextBox ID="salarioBox" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </asp:Panel>
        </div>

        <div class="form-group mb-3">
            <asp:Button ID="InsertBtn" runat="server" Text="Criar" CssClass="btn btn-primary" OnClick="InsertBtn_Click" />
            <asp:Button ID="UpdateBtn" runat="server" Text="Atualizar" CssClass="btn btn-warning" OnClick="UpdateBtn_Click" />
            <asp:Button ID="DeleteBtn" runat="server" Text="Excluir" CssClass="btn btn-danger" OnClick="DeleteBtn_Click" />
            <asp:Button ID="CleanBtn" runat="server" Text="Limpar" CssClass="btn btn-secondary" OnClick="CleanBtn_Click" />
        </div>


        <asp:GridView ID="GridViewList" runat="server" CssClass="table" AutoGenerateColumns="False" OnRowCommand="GridViewList_RowCommand">
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
                <asp:BoundField DataField="Salario" HeaderText="Salário" DataFormatString="R$ {0:N2}" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server" Text="Selecionar" CssClass="btn btn-primary" CommandName="ViewDetails" CommandArgument='<%# Bind("ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </main>

</asp:Content>
