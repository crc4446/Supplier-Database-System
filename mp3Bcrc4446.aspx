<%@ Page Title="" Language="C#" MasterPageFile="~/MIS316/MasterPagecrc4446.master" AutoEventWireup="true" CodeFile="mp3Bcrc4446.aspx.cs" Inherits="MIS316_mp3Bcrc4446" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnlLoadOrders" runat="server">
        <br />
        <br />
        <asp:DropDownList ID="ddlChooseACustomer" runat="server" AppendDataBoundItems="True" DataSourceID="dsChooseACustomer" DataTextField="Full Name" DataValueField="customerId">
            <asp:ListItem Value="0">- Choose a Customer -</asp:ListItem>
        </asp:DropDownList>
        &nbsp;<asp:RequiredFieldValidator ID="rfvChooseACustomer" runat="server" ControlToValidate="ddlChooseACustomer" Display="Dynamic" ErrorMessage="* required" ForeColor="Red" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnLoadOrders" runat="server" Text="Load Orders" OnClick="btnLoadOrders_Click" />
        <br />
        <br />
        <asp:SqlDataSource ID="dsChooseACustomer" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT customerId, lastName + ', ' + firstName AS [Full Name] FROM Customer ORDER BY lastName"></asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlCustomersPrevOrders" runat="server" Visible="False">
        <table>
            <tr dir="ltr">
                <td aria-dropeffect="none" aria-haspopup="False" dir="ltr">
                    <asp:CheckBox ID="cbCustomerDetails" runat="server" AutoPostBack="True" OnCheckedChanged="cbCustomerDetails_CheckedChanged" Text="Customer Details" />
                </td>
                <td dir="ltr">
                    <asp:DetailsView ID="dvCustomerDetails" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="customerId" DataSourceID="dsCustomerDetails" ForeColor="#333333" GridLines="None" Visible="False">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                            <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
                            <asp:BoundField DataField="phone" HeaderText="Phone Number" SortExpression="phone" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:GridView ID="gvCustomersPrevOrders" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="orderid" DataSourceID="dsCustomersPrevOrders" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvCustomersPrevOrders_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="orderNumber" HeaderText="Order #" SortExpression="orderNumber" />
                <asp:BoundField DataField="orderDate" HeaderText="Date of Order" SortExpression="orderDate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="totalAmount" HeaderText="Total Amount" SortExpression="totalAmount" DataFormatString="{0:c}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="NumberOfProducts" HeaderText="# Products" ReadOnly="True" SortExpression="NumberOfProducts" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" HeaderText="View Products" SelectText="View Products" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <br />
        <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="dsCustomerDetails" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT customerId, firstName, lastName, city, country, phone FROM Customer WHERE (customerId = @customerId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlChooseACustomer" Name="customerId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCustomersPrevOrders" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT Customer.customerId, [Order].orderid, [Order].orderNumber, [Order].orderDate, [Order].totalAmount, COUNT(Product.productId) AS NumberOfProducts FROM Product INNER JOIN OrderItem ON Product.productId = OrderItem.productId INNER JOIN [Order] ON OrderItem.orderId = [Order].orderid INNER JOIN Customer ON [Order].customerId = Customer.customerId GROUP BY [Order].orderid, [Order].orderNumber, [Order].orderDate, [Order].totalAmount, Customer.customerId HAVING (Customer.customerId = @customerId) ORDER BY [Order].orderNumber DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlChooseACustomer" Name="customerId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </asp:Panel>
    <asp:Panel ID="pnlViewProducts" runat="server">
        <br />
        <asp:DetailsView ID="dvCustomersPrevOrders" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="orderid" DataSourceID="dsCustomersPrevOrdersDV" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="orderNumber" HeaderText="Order #" SortExpression="orderNumber" />
                <asp:BoundField DataField="orderDate" HeaderText="Date of Order" SortExpression="orderDate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="totalAmount" HeaderText="Total Amount" SortExpression="totalAmount" DataFormatString="{0:c}" />
                <asp:BoundField DataField="NumberOfProducts" HeaderText="# Products" ReadOnly="True" SortExpression="NumberOfProducts" />
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
        <br />
        <asp:GridView ID="gvProductInfo" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="orderid" DataSourceID="dsProductsDetails" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvProductInfo_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
                <asp:BoundField DataField="packagingDesc" HeaderText="Packaging" SortExpression="packagingDesc" />
                <asp:BoundField DataField="isDiscontinued" HeaderText="Discontinued?" SortExpression="isDiscontinued">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="unitPrice" HeaderText="Unit Price" SortExpression="unitPrice" DataFormatString="{0:c}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="quantity" HeaderText="Qty" SortExpression="quantity" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" ReadOnly="True" SortExpression="TotalPrice" DataFormatString="{0:c}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:CommandField ShowSelectButton="True" SelectText="View Supplier" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <br />
        <asp:FormView ID="fvSupplier" runat="server" CellPadding="4" DataKeyNames="orderId" DataSourceID="dsViewSupplier" ForeColor="#333333" Visible="False">
            <EditItemTemplate>
                supplierId:
                <asp:Label ID="supplierIdLabel1" runat="server" Text='<%# Eval("supplierId") %>' />
                <br />
                supplierName:
                <asp:TextBox ID="supplierNameTextBox" runat="server" Text='<%# Bind("supplierName") %>' />
                <br />
                contactPerson:
                <asp:TextBox ID="contactPersonTextBox" runat="server" Text='<%# Bind("contactPerson") %>' />
                <br />
                Expr1:
                <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
                <br />
                phone:
                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                supplierName:
                <asp:TextBox ID="supplierNameTextBox" runat="server" Text='<%# Bind("supplierName") %>' />
                <br />
                contactPerson:
                <asp:TextBox ID="contactPersonTextBox" runat="server" Text='<%# Bind("contactPerson") %>' />
                <br />
                Expr1:
                <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
                <br />
                phone:
                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td><strong>Supplier:</strong></td>
                        <td>
                            <asp:Label ID="supplierNameLabel" runat="server" Text='<%# Bind("supplierName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Contact:</strong></td>
                        <td>
                            <asp:Label ID="contactPersonLabel" runat="server" Text='<%# Bind("contactPerson") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Expr1Label" runat="server" Text='<%# Bind("Expr1") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:FormView>
        <br />
        <br />
        <br />
        <asp:Button ID="btnGoBackTwo" runat="server" OnClick="btnGoBackTwo_Click" Text="Go Back" Visible="False" />
        <br />
        <asp:SqlDataSource ID="dsCustomersPrevOrdersDV" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT [Order].orderid, [Order].orderNumber, [Order].orderDate, [Order].totalAmount, COUNT(Product.productId) AS NumberOfProducts FROM Product INNER JOIN OrderItem ON Product.productId = OrderItem.productId INNER JOIN [Order] ON OrderItem.orderId = [Order].orderid GROUP BY [Order].orderid, [Order].orderNumber, [Order].orderDate, [Order].totalAmount HAVING ([Order].orderid = @orderid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvCustomersPrevOrders" Name="orderid" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsProductsDetails" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT DISTINCT [Order].orderid, Product.productId, Product.productName, Product.packagingDesc, Product.isDiscontinued, OrderItem.unitPrice, OrderItem.quantity, OrderItem.quantity * OrderItem.unitPrice AS TotalPrice FROM [Order] INNER JOIN OrderItem ON [Order].orderid = OrderItem.orderId INNER JOIN Product ON OrderItem.productId = Product.productId GROUP BY Product.productId, Product.productName, Product.packagingDesc, OrderItem.unitPrice, Product.isDiscontinued, [Order].orderid, OrderItem.quantity HAVING ([Order].orderid = @orderid) ORDER BY Product.productName">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvCustomersPrevOrders" Name="orderid" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsViewSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:mis316SpiceSuppliesConnectionString %>" SelectCommand="SELECT Supplier.supplierId, Supplier.supplierName, Supplier.contactPerson, Supplier.city + ', ' + Supplier.country AS Expr1, Supplier.phone, OrderItem.orderId FROM Supplier INNER JOIN Product ON Supplier.supplierId = Product.supplierId INNER JOIN OrderItem ON Product.productId = OrderItem.productId WHERE (OrderItem.orderId = @orderId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvProductInfo" Name="orderId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

