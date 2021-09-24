<%@ Page Title="" Language="C#" MasterPageFile="~/MIS316/MasterPagecrc4446.master" AutoEventWireup="true" CodeFile="mp3Acrc4446.aspx.cs" Inherits="MIS316_mp3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
        .auto-style2 {
            width: 182px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Choose a Supplier:
    <asp:DropDownList ID="ddlSupplier" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CausesValidation="True" DataSourceID="dsSupplier" DataTextField="supplierName" DataValueField="supplierId" OnSelectedIndexChanged="ddlSupplier_SelectedIndexChanged" ValidationGroup="supplierValidator">
        <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="rfvSupplier" runat="server" ControlToValidate="ddlSupplier" Display="Dynamic" ErrorMessage="* required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="supplierValidator"></asp:RequiredFieldValidator>
    </p>
    <p>
        Choose a Product:
    <asp:DropDownList ID="ddlProduct" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CausesValidation="True" DataSourceID="dsProduct" DataTextField="productName" DataValueField="productId" ValidationGroup="productValidator" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
        <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="rfvProduct" runat="server" ControlToValidate="ddlProduct" Display="Dynamic" ErrorMessage="* required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="productValidator"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:FormView ID="fvSupplierProduct" runat="server" DataKeyNames="supplierId,productId" DataSourceID="dsOneSupplier">
            <EditItemTemplate>
                supplierId:
                <asp:Label ID="supplierIdLabel1" runat="server" Text='<%# Eval("supplierId") %>' />
                <br />
                supplierName:
                <asp:TextBox ID="supplierNameTextBox" runat="server" Text='<%# Bind("supplierName") %>' />
                <br />
                Location:
                <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                <br />
                productId:
                <asp:Label ID="productIdLabel1" runat="server" Text='<%# Eval("productId") %>' />
                <br />
                productName:
                <asp:TextBox ID="productNameTextBox" runat="server" Text='<%# Bind("productName") %>' />
                <br />
                listPrice:
                <asp:TextBox ID="listPriceTextBox" runat="server" Text='<%# Bind("listPrice") %>' />
                <br />
                packagingDesc:
                <asp:TextBox ID="packagingDescTextBox" runat="server" Text='<%# Bind("packagingDesc") %>' />
                <br />
                isDiscontinued:
                <asp:CheckBox ID="isDiscontinuedCheckBox" runat="server" Checked='<%# Bind("isDiscontinued") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                supplierName:
                <asp:TextBox ID="supplierNameTextBox" runat="server" Text='<%# Bind("supplierName") %>' />
                <br />
                Location:
                <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                <br />
                productName:
                <asp:TextBox ID="productNameTextBox" runat="server" Text='<%# Bind("productName") %>' />
                <br />
                listPrice:
                <asp:TextBox ID="listPriceTextBox" runat="server" Text='<%# Bind("listPrice") %>' />
                <br />
                packagingDesc:
                <asp:TextBox ID="packagingDescTextBox" runat="server" Text='<%# Bind("packagingDesc") %>' />
                <br />
                isDiscontinued:
                <asp:CheckBox ID="isDiscontinuedCheckBox" runat="server" Checked='<%# Bind("isDiscontinued") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                    <tr style="vertical-align: top">
                        <td><strong><span class="auto-style1">Supplier Information</span></strong><table style="vertical-align: top">
                            <tr>
                                <td>Name:</td>
                                <td>
                                    <asp:Label ID="supplierNameLabel" runat="server" Text='<%# Bind("supplierName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Location:</td>
                                <td>
                                    <asp:Label ID="LocationLabel" runat="server" Text='<%# Bind("Location") %>' />
                                </td>
                            </tr>
                            </table>
                        </td>
                        <td><strong><span class="auto-style1">Product Information</span></strong>&nbsp;<table>
                            <tr>
                                <td dir="ltr" style="vertical-align: top">Name:</td>
                                <td class="auto-style2" dir="ltr" style="vertical-align: top">
                                    <asp:Label ID="productNameLabel" runat="server" Text='<%# Bind("productName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td dir="ltr" style="vertical-align: top">List Price:</td>
                                <td class="auto-style2" dir="ltr" style="vertical-align: top">
                                    <asp:Label ID="listPriceLabel" runat="server" Text='<%# Bind("listPrice") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td dir="ltr" style="vertical-align: top">Packaging Description:</td>
                                <td class="auto-style2" dir="ltr" style="vertical-align: top">
                                    <asp:Label ID="packagingDescLabel" runat="server" Text='<%# Bind("packagingDesc") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td dir="ltr" style="vertical-align: top">Discontinued?</td>
                                <td class="auto-style2" dir="ltr" style="vertical-align: top">
                                    <asp:CheckBox ID="isDiscontinuedCheckBox" runat="server" Checked='<%# Bind("isDiscontinued") %>' Enabled="false" />
                                </td>
                            </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <strong><span class="auto-style1">
                <br />
                </span></strong>
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        <asp:LinkButton ID="lbContactDetails" runat="server" OnClick="lbContactDetails_Click" Visible="False">Show Contact Details</asp:LinkButton>
    &nbsp;<asp:LinkButton ID="lbHideContact" runat="server" OnClick="lbHideContact_Click" Visible="False">Hide Contact Details</asp:LinkButton>
    </p>
        <asp:DetailsView ID="dvContactDetails" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="supplierId,productId" DataSourceID="dsContactDetails" ForeColor="#333333" GridLines="None" Visible="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="contactPerson" HeaderText="Contact Person" SortExpression="contactPerson" />
                <asp:BoundField DataField="phone" HeaderText="Phone Number" SortExpression="phone" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    <p>
    </p>
    <p>
    </p>
    <asp:SqlDataSource ID="dsSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT supplierId, supplierName FROM Supplier"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsProduct" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT productId, supplierId, productName FROM Product WHERE (supplierId = @supplierid) ORDER BY productName">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSupplier" Name="supplierid" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsOneSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT Supplier.supplierId, Supplier.supplierName, Supplier.city + ', ' + Supplier.country AS Location, Product.productId, Product.productName, Product.listPrice, Product.packagingDesc, Product.isDiscontinued FROM Supplier INNER JOIN Product ON Supplier.supplierId = Product.supplierId WHERE (Supplier.supplierId = @supplierid) AND (Product.productId = @productid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSupplier" Name="supplierid" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlProduct" Name="productid" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="dsContactDetails" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT Supplier.supplierId, Product.productId, Supplier.contactPerson, Supplier.phone FROM Supplier INNER JOIN Product ON Supplier.supplierId = Product.supplierId WHERE (Supplier.supplierId = @supplierid) AND (Product.productId = @productid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSupplier" Name="supplierid" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlProduct" Name="productid" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

