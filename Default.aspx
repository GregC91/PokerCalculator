<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PokerCalculator._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>



    <style type="text/css">
        body 
        {
            background: url("../images/poker2.jpg") no-repeat center center fixed;
            
            min-height:100%;

            background-size:cover;

                                     
        }
    </style>

    <div class="container"> 
        
    <div class="row">
                
   
        <div class="col-sm-5">       
            <asp:Label ID="projectTitle" runat="server" Text="Poker Pot Odds Calculator" Font-Bold="True" Font-Size="X-Large" ForeColor="White"></asp:Label>
                <br />
                <br />
            <asp:Label ID="instructions" runat="server" Text="Instructions:" Font-Bold="true" Font-Size="Medium" ForeColor="White"></asp:Label>
                <br />
            <asp:Label ID="instructionsLabel" runat="server" ForeColor="White" Font-Size="Small" Text="This calculator has three components designed to make simple caclculations while playing poker.  
                The first component consists of calculating the pot odds the user
                is receiving at any point during a hand.  The user must enter numerical information into the appropriate field and press calculate.  The user 
                will then have the pot odds returned to him. The second and third component allow the user to enter how many cards will improve their hand and then
                evaluate this figure to the pot odds to make a decision."></asp:Label>
            <br />
            <br />
            <asp:Label ID="glossary" runat="server" Text="Glossary:" Font-Bold="true" Font-Size="Medium" ForeColor="White"></asp:Label>
            <br />
            <asp:Label ID="potSizeDefinition" runat="server" Text="Pot Size: The amount of chips in the pot that can be won in a hand." Font-Bold="true" Font-Size="Small" ForeColor="White"></asp:Label>
            <br />

            <asp:Label ID="callDefintion" runat="server" Text="Call: To call the amount your opponent has bet." Font-Bold="true" Font-Size="Small" ForeColor="White"></asp:Label>
            <br />

            <asp:Label ID="potOddsDefinition" runat="server" Text="Pot Odds: The odds you are receiving when from the pot when your opponent has bet." Font-Bold="true" Font-Size="Small" ForeColor="White"></asp:Label>
            <br />

            <asp:Label ID="outsDefinition" runat="server" Text="Outs: The number of cards in the deck that could improve your hand." Font-Bold="true" Font-Size="Small" ForeColor="White"></asp:Label>
            <br />

            <asp:Label ID="flopDefinition" runat="server" Text="Flop: The first three community cards dealt." Font-Bold="true" Font-Size="Small" ForeColor="White"></asp:Label>
            <br />

            <asp:Label ID="turnDefinition" runat="server" Text="Turn: The fourth card dealt after the flop action has been completed." Font-Bold="true" Font-Size="Small" ForeColor="White"></asp:Label> 
            <br />
            <br />
               
            <asp:Label ID="disclaimerLabel" runat="server" Text="Please note that this calculator is intended to be used as a rough guide only.  Calculations that involve your hand improving are approximations.
                  The calculator doesn't factor in implied or reverse implied odds.  You should only count cards that improve your hand if you believe they will be good enough to win at showdown." Font-Bold="true" Font-Size="X-Small" ForeColor="White"></asp:Label>    

        </div>

        <div class ="col-sm-1">
            </div>
        
        <div class="col-sm-3">
            <asp:Panel ID="Panel1" runat="server">
                <br />
                <br />
                <br />
                <br />
            <asp:Label ID="potSizeLabel" runat="server" Text="Pot Size:" Font-Bold="True" ForeColor="White"></asp:Label>
                <br />
            <asp:TextBox ID="potSizeInput" runat="server" data-toggle="tooltip" title="Please enter the amount in the pot"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="group1" runat="server" ControlToValidate="potSizeInput" ForeColor="Red" ErrorMessage="Required!"></asp:RequiredFieldValidator>       
            <asp:RegularExpressionValidator ID="potSizeValidator" runat="server" ControlToValidate="potSizeInput" ErrorMessage="Please enter numerical information only." ValidationExpression="^[\d.]+$" ForeColor="White"></asp:RegularExpressionValidator>            
                <br />
                <br />
            <asp:Label ID="amountToCallLabel" runat="server" Text="Amount To Call:" Font-Bold="True" ForeColor="White"></asp:Label>
                <br />            
            <asp:TextBox ID="callSizeInput" runat="server" data-toggle="tooltip"  title="Please enter the amount to call"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="group1" runat="server" ControlToValidate="callSizeInput" ForeColor="Red" ErrorMessage="Required!"></asp:RequiredFieldValidator>                                                 
            <asp:RegularExpressionValidator ID="callSizeValidator" runat="server" ControlToValidate="callSizeInput" ErrorMessage="Please enter numerical information only." ValidationExpression="^[\d.]+$" ForeColor="White"></asp:RegularExpressionValidator>
                <br />
            <asp:Button ID="potOddsButton" ValidationGroup="group1" runat="server" class="btn btn-primary" Text="Calculate Pot Odds" OnClick="potOddsButton_Click" Font-Bold="True" />
                <br />           
            <asp:Label ID="returnPotOddsLabel" runat="server" Font-Bold="True" ForeColor="White"></asp:Label>
                <br />
            <asp:Label ID="returnEquityLabel" runat="server" Font-Bold="True" ForeColor="White"></asp:Label>
            </asp:Panel>
            </div>
            <div class="col-sm-3"> 
            <asp:Panel ID="Panel2" runat="server">
                <br />
                <br />
                <br />
                <br />
            <asp:Label ID="flopOutsLabel" runat="server" Text="Number of outs on the flop:" Font-Bold="True" ForeColor="White"></asp:Label>
                <br />                
                <asp:TextBox ID="flopOutsInput" runat="server" data-toggle="tooltip"  title="Please enter the number of outs you have"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="group2" runat="server" ControlToValidate="flopOutsInput" ForeColor="Red" ErrorMessage="Required!"></asp:RequiredFieldValidator>                                   
            <asp:RegularExpressionValidator ID="flopOutsValidator" runat="server" ControlToValidate="flopOutsInput" ErrorMessage="Please enter numerical information only." ValidationExpression="^[\d.]+$" ForeColor="White"></asp:RegularExpressionValidator>    
            <asp:Button ID="flopOutsButton" ValidationGroup="group2" runat="server" class=" btn btn-primary" Text="Calculate chance to improve" OnClick="flopOutsButton_Click" Font-Bold="true" />
                <br />
            <asp:Label ID="returnFlopOutsLabel" runat="server" Text="" Font-Bold="true" ForeColor="White"></asp:Label>
                <br />
                <br />
            <asp:Label ID="turnOutsLabel" runat="server" Text="Number of outs on the turn:" Font-Bold="True" ForeColor="White"></asp:Label>
                <br />
            <asp:TextBox ID="turnOutsInput" runat="server" data-toggle="tooltip"  title="Please enter the number of outs you have"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="group3" runat="server" ControlToValidate="turnOutsInput" ForeColor="Red" ErrorMessage="Required!"></asp:RequiredFieldValidator>                                   
            <asp:RegularExpressionValidator ID="turnOutsValidator" runat="server" ControlToValidate="turnOutsInput" ErrorMessage="Please enter numerical information only." ValidationExpression="^[\d.]+$" ForeColor="White"></asp:RegularExpressionValidator>
            <asp:Button ID="turnOutsButton" ValidationGroup="group3" runat="server" class="btn btn-primary" Text="Calculate chance to improve" OnClick="turnOutsButton_Click" Font-Bold="true" />
                <br />
            <asp:Label ID="returnTurnOutsLabel" runat="server" Text="" Font-Bold="true" ForeColor="White"></asp:Label>
                <br />
                <br />
            <asp:Button ID="Reset" runat="server" class="btn btn-danger" Text="Reset all fields" OnClick="resetButton_Click" Font-Bold="true" />
                <br />
                <br />
                <br />
            </asp:Panel>

        </div>
        </div>
        </div>
        
       



</asp:Content>
