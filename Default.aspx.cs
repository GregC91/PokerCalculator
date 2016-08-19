using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PokerCalculator
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void potOddsButton_Click(object sender, EventArgs e)
        {
            //Converting user inputs to int that can be stored in decimal form
            decimal potSize = decimal.Parse(potSizeInput.Text);


            decimal amountToCall = decimal.Parse(callSizeInput.Text);
            if (amountToCall != 0)
            {
                //To convert to odds, the function divides the potSize by amountToCall
                //Then the function divides amountToCall by itself to get the odds in the simplest form
                decimal simplePotSize = potSize / amountToCall;
                decimal simpleAmountToCall = amountToCall / amountToCall;



                //Converting odds to %equity
                decimal equity = (amountToCall / (potSize + amountToCall) * 100);


                //return the odds in simplest form 
                returnPotOddsLabel.Text = "Pot Odds: " + Math.Round(simplePotSize, 2) + ":" + simpleAmountToCall;
                returnEquityLabel.Text = "Equity required to call: " + Math.Round(equity, 2) + "%";
            }
            else
            {
                returnPotOddsLabel.Text = "Did your opponent check?  Being checked to in poker means you aren't required to invest chips into the pot to stay in the hand.";
            }
        }

            protected void flopOutsButton_Click(object sender, EventArgs e)
            {
            //Coverting user inputs to int that can be stored in decimal form
            decimal flopOuts = decimal.Parse(flopOutsInput.Text);

            //Calculation for seeing how likely the user is to improve their hand on the flop
            decimal flopOutsEquity = (flopOuts * 4) - 1;

            //return the chances of the user improving their hand
            returnFlopOutsLabel.Text = "The chance of improving your hand is: " + flopOutsEquity + "%";

            }

            protected void turnOutsButton_Click(object sender, EventArgs e)
            {
            //Converting user inputs to int that can be stored in decimal form
            decimal turnOuts = decimal.Parse(turnOutsInput.Text);

            //Calculation for seeing how likely the user is to improve their hand on the turn
            decimal turnOutsEquity = (turnOuts * 2) + 1;

            //return the chances of the user improving their hand
            returnTurnOutsLabel.Text = "The chance of improving your hand is: " + turnOutsEquity + "%";
            }

            protected void resetButton_Click(object sender, EventArgs e)
            {
            //Resetting all fields to clear the calculator
            potSizeInput.Text = "";
            callSizeInput.Text = "";
            turnOutsInput.Text = "";
            flopOutsInput.Text = "";
            returnEquityLabel.Text = "";
            returnPotOddsLabel.Text = "";
            returnFlopOutsLabel.Text = "";
            returnTurnOutsLabel.Text = "";
            }
    }
}