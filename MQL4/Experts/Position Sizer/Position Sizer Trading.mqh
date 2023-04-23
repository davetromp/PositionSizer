//+------------------------------------------------------------------+
//|                                       Position Sizer Trading.mqh |
//|                                  Copyright © 2023, DaveTromp.com |
//|                                       https://www.davetromp.com/ |
//+------------------------------------------------------------------+
#include <stdlib.mqh>

//+------------------------------------------------------------------+
//| Main trading function.                                           |
//+------------------------------------------------------------------+
void Trade()
{
    string Commentary = "PS EA";

    if (!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
    {
        Alert("AutoTrading disabled! Please enable AutoTrading.");
        return;
    }

    if (WarningSL != "") // Too close or wrong value.
    {
        Alert("Stop-loss problem: " + WarningSL);
        return;
    }

    if (OutputPositionSize <= 0)
    {
        Alert("Wrong position size value!");
        return;
    }

    double TP[], TPShare[]; // Mimics sets.TP[] and sets.TPShare[], but always includes the main TP too.

    ArrayResize(TP, TakeProfitsNumber);
    ArrayResize(TPShare, TakeProfitsNumber);

    if (TakeProfitsNumber > 1)
    {
        Print("Multiple TP volume share sum = ", TotalVolumeShare, ".");
        if ((TotalVolumeShare < 99) || (TotalVolumeShare > 100))
        {
            Alert("Incorrect volume sum for multiple TPs - not taking any trades.");
            return;
        }
        for (int i = 0; i < TakeProfitsNumber; i++)
        {
            TP[i] = sets.TP[i];
            TPShare[i] = sets.TPShare[i];
        }
    }
    else
    {
        // No multiple TPs, use single TP for 100% of volume.
        TP[0] = sets.TakeProfitLevel;
        TPShare[0] = 100;
    }

    if (sets.Commentary != "") Commentary = sets.Commentary;

    if (sets.CommentAutoSuffix) Commentary += IntegerToString((int)TimeLocal());

    if ((sets.DisableTradingWhenLinesAreHidden) && (!sets.ShowLines))
    {
        Alert("Not taking a trade - lines are hidden and panel is set not to trade when they are hidden.");
        return;
    }

    RefreshRates();

    if (sets.MaxSpread > 0)
    {
        int spread = (int)((Ask - Bid) / Point);
        if (spread > sets.MaxSpread)
        {
            Alert("Not taking a trade - current spread (", spread, ") > maximum spread (", sets.MaxSpread, ").");
            return;
        }
    }

    if (sets.MaxEntrySLDistance > 0)
    {
        int CurrentEntrySLDistance = (int)(MathAbs(sets.StopLossLevel - sets.EntryLevel) / Point);
        if (CurrentEntrySLDistance > sets.MaxEntrySLDistance)
        {
            Alert("Not taking a trade - current Entry/SL distance (", CurrentEntrySLDistance, ") > maximum Entry/SL distance (", sets.MaxEntrySLDistance, ").");
            return;
        }
    }

    if (sets.MinEntrySLDistance > 0)
    {
        int CurrentEntrySLDistance = (int)(MathAbs(sets.StopLossLevel - sets.EntryLevel) / Point);
        if (CurrentEntrySLDistance < sets.MinEntrySLDistance)
        {
            Alert("Not taking a trade - current Entry/SL distance (", CurrentEntrySLDistance, ") < minimum Entry/SL distance (", sets.MinEntrySLDistance, ").");
            return;
        }
    }

    if (sets.MaxNumberOfTrades > 0)
    {
        int total = OrdersTotal();
        int cnt = 0;
        for (int i = 0; i < total; i++)
        {
            if (!OrderSelect(i, SELECT_BY_POS)) continue;
            if ((sets.MagicNumber != 0) && (OrderMagicNumber() != sets.MagicNumber)) continue;
            if ((!sets.AllSymbols) && (OrderSymbol() != Symbol())) continue;
            if ((OrderType() == OP_BUY) || (OrderType() == OP_SELL)) cnt++;
        }
        if (cnt >= sets.MaxNumberOfTrades)
        {
            Alert("Not taking a trade - current # of traes (", cnt, ") >= maximum number of trades (", sets.MaxNumberOfTrades, ").");
            return;
        }
    }

    ENUM_SYMBOL_TRADE_EXECUTION Execution_Mode = (ENUM_SYMBOL_TRADE_EXECUTION)SymbolInfoInteger(Symbol(), SYMBOL_TRADE_EXEMODE);
    Print("Execution mode: ", EnumToString(Execution_Mode));

    ENUM_ORDER_TYPE ot;
    if (sets.EntryType == Pending)
    {
        // Sell
        if (sets.TradeDirection == Short)
        {
            // Stop
            if (sets.EntryLevel < Bid) ot = OP_SELLSTOP;
            // Limit
            else ot = OP_SELLLIMIT;
        }
        // Buy
        else
        {
            // Stop
            if (sets.EntryLevel > Ask) ot = OP_BUYSTOP;
            // Limit
            else ot = OP_BUYLIMIT;
        }
    }
    // Instant
    else
    {
        // Sell
        if (sets.TradeDirection == Short) ot = OP_SELL;
        // Buy
        else ot = OP_BUY;
    }

    double PositionSize = OutputPositionSize;
    
    if ((sets.SubtractPendingOrders) || (sets.SubtractPositions))
    {
        double existing_volume_buy = 0, existing_volume_sell = 0;
        CalculateOpenVolume(existing_volume_buy, existing_volume_sell);
        Print("Found existing buy volume = ", DoubleToString(existing_volume_buy, LotStep_digits));
        Print("Found existing sell volume = ", DoubleToString(existing_volume_sell, LotStep_digits));
        if ((ot == OP_BUY) || (ot == OP_BUYLIMIT) || (ot == OP_BUYSTOP)) PositionSize -= existing_volume_buy;
        else PositionSize -= existing_volume_sell;
        Print("Adjusted position size = ", DoubleToString(PositionSize, LotStep_digits));
        if (PositionSize < 0)
        {
            Alert("Adjusted position size is less than zero. Not executing any trade.");
            return;
        }
    }

    if (sets.MaxPositionSize > 0)
    {
        if (PositionSize > sets.MaxPositionSize)
        {
            Print("Position size (", DoubleToString(sets.PositionSize, LotStep_digits), ") > maximum position size (", DoubleToString(sets.MaxPositionSize, LotStep_digits), "). Setting position size to ", DoubleToString(sets.MaxPositionSize, LotStep_digits), ".");
            PositionSize = sets.MaxPositionSize;
        }
    }

    if (sets.AskForConfirmation)
    {
        // Evoke confirmation modal window.
        string caption = "Position Sizer on " + Symbol() + " @ " + StringSubstr(EnumToString((ENUM_TIMEFRAMES)Period()), 7) + ": Execute the trade?";
        string message;
        string order_type_text = "";
        string currency = AccountInfoString(ACCOUNT_CURRENCY);
        switch(ot)
        {
        case OP_BUY:
            order_type_text = "Buy";
            break;
        case OP_BUYSTOP:
            order_type_text = "Buy Stop";
            break;
        case OP_BUYLIMIT:
            order_type_text = "Buy Limit";
            break;
        case OP_SELL:
            order_type_text = "Sell";
            break;
        case OP_SELLSTOP:
            order_type_text = "Sell Stop";
            break;
        case OP_SELLLIMIT:
            order_type_text = "Sell Limit";
            break;
        default:
            break;
        }

        message = "Order: " + order_type_text + "\n";
        message += "Size: " + DoubleToString(PositionSize, LotStep_digits);
        if (TakeProfitsNumber > 1) message += " (multiple)";
        message += "\n";
        message += EnumToString(sets.AccountButton);
        message += ": " + FormatDouble(DoubleToString(AccSize, 2)) + " " + account_currency + "\n";
        message += "Risk: " + FormatDouble(DoubleToString(OutputRiskMoney)) + " " + account_currency + "\n";
        if (PositionMargin != 0) message += "Margin: " + FormatDouble(DoubleToString(PositionMargin, 2)) + " " + account_currency + "\n";
        message += "Entry: " + DoubleToString(sets.EntryLevel, _Digits) + "\n";
        if (!sets.DoNotApplyStopLoss) message += "Stop-loss: " + DoubleToString(sets.StopLossLevel, _Digits) + "\n";
        if ((sets.TakeProfitLevel > 0) && (!sets.DoNotApplyTakeProfit)) message += "Take-profit: " + DoubleToString(sets.TakeProfitLevel, _Digits);
        if (TakeProfitsNumber > 1) message += " (multiple)";
        message += "\n";

        int ret = MessageBox(message, caption, MB_OKCANCEL | MB_ICONWARNING);
        if (ret == IDCANCEL)
        {
            Print("Trade canceled.");
            return;
        }
    }

    double AccumulatedPositionSize = 0; // Total PS used by additional TPs.

    // Cycle to calculate volume for each partial trade.
    // The goal is to use normal rounded down values for additional TPs and then throw the remainder to the main TP.
    for (int j = TakeProfitsNumber - 1; j >= 0; j--)
    {
        double position_size = PositionSize * TPShare[j] / 100.0;

        if (position_size < MinLot)
        {
            Print("Position size ", position_size, " < broker's minimum position size. Not executing the trade.");
            ArrayPositionSize[j] = 0;
            continue;
        }
        else if (position_size > MaxLot)
        {
            Print("Position size ", position_size, " > broker's maximum position size. Reducing it.");
            position_size = MaxLot;
        }
        double steps = 0;
        if (LotStep != 0) steps = position_size / LotStep;
        if (MathAbs(MathRound(steps) - steps) < 0.00000001) steps = MathRound(steps);
        if (MathFloor(steps) < steps)
        {
            position_size = MathFloor(steps) * LotStep;
            Print("Adjusting position size to the broker's Lot Step parameter.");
        }

        // If this is one of the additional TPs, then count its PS towards total PS that will be open for additional TPs.
        if (j > 0)
        {
            AccumulatedPositionSize += position_size;
        }
        else // For the main TP, use the remaining part of the total PS.
        {
            position_size = PositionSize - AccumulatedPositionSize;
        }
        ArrayPositionSize[j] = position_size;
    }

    bool isOrderPlacementFailing = false; // Track if any of the order-operations fail.
    bool AtLeastOneOrderExecuted = false; // Track if at least one order got executed. Required for cases when some of the multiple TP orders have volume < minimum volume and don't get executed.

    // Going through a cycle to execute multiple TP trades.
    for (int j = 0; j < TakeProfitsNumber; j++)
    {
        if (ArrayPositionSize[j] == 0) continue; // Calculated PS < broker's minimum.
        double order_sl = sets.StopLossLevel;
        double sl = order_sl;
        double order_tp = NormalizeDouble(TP[j], _Digits);
        double tp = order_tp;
        double position_size = NormalizeDouble(ArrayPositionSize[j], LotStep_digits);

        // Market execution mode - preparation.
        if ((Execution_Mode == SYMBOL_TRADE_EXECUTION_MARKET) && (sets.EntryType == Instant))
        {
            // No SL/TP allowed on instant orders.
            order_sl = 0;
            order_tp = 0;
        }
        if (sets.DoNotApplyStopLoss)
        {
            sl = 0;
            order_sl = 0;
        }
        if (sets.DoNotApplyTakeProfit)
        {
            tp = 0;
            order_tp = 0;
        }

        if ((order_tp != 0) && (((order_tp <= sets.EntryLevel) && ((ot == OP_BUY) || (ot == OP_BUYLIMIT) || (ot == OP_BUYSTOP))) || ((order_tp >= sets.EntryLevel) && ((ot == OP_SELL) || (ot == OP_SELLLIMIT) || (ot == OP_SELLSTOP))))) order_tp = 0; // Do not apply TP if it is invald. SL will still be applied.
        int ticket = OrderSend(Symbol(), ot, position_size, sets.EntryLevel, sets.MaxSlippage, order_sl, order_tp, Commentary, sets.MagicNumber);
        if (ticket == -1)
        {
            int error = GetLastError();
            Print("Execution failed. Error: ", IntegerToString(error), " - ", ErrorDescription(error), ".");
            isOrderPlacementFailing = true;
        }
        else
        {
            if (TakeProfitsNumber == 1) Print("Order executed. Ticket: ", ticket, ".");
            else Print("Order #", j, " executed. Ticket: ", ticket, ".");
            AtLeastOneOrderExecuted = true;
        }
        if (!sets.DoNotApplyTakeProfit) tp = TP[j];
        // Market execution mode - applying SL/TP.
        if ((Execution_Mode == SYMBOL_TRADE_EXECUTION_MARKET) && (sets.EntryType == Instant) && (ticket != -1) && ((sl != 0) || (tp != 0)))
        {
            if (!OrderSelect(ticket, SELECT_BY_TICKET))
            {
                Print("Failed to find the order to apply SL/TP.");
                isOrderPlacementFailing = true;
                break;
            }
            for (int i = 0; i < 10; i++)
            {
                if ((tp != 0) && (((tp <= OrderOpenPrice()) && (ot == OP_BUY)) || ((tp >= OrderOpenPrice()) && (ot == OP_SELL)))) tp = 0; // Do not apply TP if it is invald. SL will still be applied.
                bool result = OrderModify(ticket, OrderOpenPrice(), sl, tp, OrderExpiration());
                if (result)
                {
                    break;
                }
                else
                {
                    Print("Error modifying the order: ", GetLastError());
                    isOrderPlacementFailing = true;
                }
            }
        }
    }
    PlaySound((isOrderPlacementFailing) || (!AtLeastOneOrderExecuted) ? "timeout.wav" : "ok.wav");
}

// Calculate volume of open positions and/or pending orders.
// Counts volumes separately for buy and sell trades and writes them into parameterss.
void CalculateOpenVolume(double &volume_buy, double &volume_sell)
{
    int total = OrdersTotal();
    for (int i = 0; i < total; i++)
    {
        // Select an order.
        if (!OrderSelect(i, SELECT_BY_POS)) continue;
        // Skip orders with a different trading instrument.
        if (OrderSymbol() != _Symbol) continue;
        // If magic number is given via PS panel and order's magic number is different - skip.
        if ((sets.MagicNumber != 0) && (OrderMagicNumber() != sets.MagicNumber)) continue;

        if (sets.SubtractPositions)
        {
            // Buy orders
            if (OrderType() == ORDER_TYPE_BUY) volume_buy += OrderLots();
            // Sell orders
            else if (OrderType() == ORDER_TYPE_SELL) volume_sell += OrderLots();
        }
        if (sets.SubtractPendingOrders)
        {
            // Buy orders
            if ((OrderType() == ORDER_TYPE_BUY_LIMIT) || (OrderType() == ORDER_TYPE_BUY_STOP)) volume_buy += OrderLots();
            // Sell orders
            else if ((OrderType() == ORDER_TYPE_SELL_LIMIT) || (OrderType() == ORDER_TYPE_SELL_STOP)) volume_sell += OrderLots();
        }
    }
}

// Does trailing based on the Magic number and symbol.
void DoTrailingStop()
{
    if ((!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED)) || (!TerminalInfoInteger(TERMINAL_CONNECTED)) || (!MQLInfoInteger(MQL_TRADE_ALLOWED))) return;

    for (int i = 0; i < OrdersTotal(); i++)
    {
        if (!OrderSelect(i, SELECT_BY_POS)) Print("OrderSelect failed " + ErrorDescription(GetLastError()) + ".");
        else if (SymbolInfoInteger(OrderSymbol(), SYMBOL_TRADE_MODE) == SYMBOL_TRADE_MODE_DISABLED) continue;
        else
        {
            if ((OrderSymbol() != Symbol()) || (OrderMagicNumber() != sets.MagicNumber)) continue;
            if (OrderType() == OP_BUY)
            {
                double SL = NormalizeDouble(Bid - sets.TrailingStopPoints * _Point, _Digits);
                if (SL > OrderStopLoss())
                {
                    if (!OrderModify(OrderTicket(), OrderOpenPrice(), SL, OrderTakeProfit(), OrderExpiration()))
                        Print("OrderModify Buy TSL failed " + ErrorDescription(GetLastError()) + ".");
                    else
                        Print("Trailing stop was applied to position - " + Symbol() + " BUY-order #" + IntegerToString(OrderTicket()) + " Lotsize = " + DoubleToString(OrderLots(), LotStep_digits) + ", OpenPrice = " + DoubleToString(OrderOpenPrice(), _Digits) + ", Stop-Loss was moved from " + DoubleToString(OrderStopLoss(), _Digits) + " to " + DoubleToString(SL, _Digits) + ".");
                }
            }
            else if (OrderType() == OP_SELL)
            {
                double SL = NormalizeDouble(Ask + sets.TrailingStopPoints * _Point, _Digits);
                if ((SL < OrderStopLoss()) || (OrderStopLoss() == 0))
                {
                    if (!OrderModify(OrderTicket(), OrderOpenPrice(), SL, OrderTakeProfit(), OrderExpiration()))
                        Print("OrderModify Sell TSL failed " + ErrorDescription(GetLastError()) + ".");
                    else
                        Print("Trailing stop was applied to position - " + Symbol() + " SELL-order #" + IntegerToString(OrderTicket()) + " Lotsize = " + DoubleToString(OrderLots(), LotStep_digits) + ", OpenPrice = " + DoubleToString(OrderOpenPrice(), _Digits) + ", Stop-Loss was moved from " + DoubleToString(OrderStopLoss(), _Digits) + " to " + DoubleToString(SL, _Digits) + ".");
                }
            }
        }
    }
}

// Sets SL to breakeven based on the Magic number and symbol.
void DoBreakEven()
{
    if ((!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED)) || (!TerminalInfoInteger(TERMINAL_CONNECTED)) || (!MQLInfoInteger(MQL_TRADE_ALLOWED))) return;

    for (int i = 0; i < OrdersTotal(); i++)
    {
        if (!OrderSelect(i, SELECT_BY_POS)) Print("OrderSelect failed " + ErrorDescription(GetLastError()) + ".");
        else if (SymbolInfoInteger(OrderSymbol(), SYMBOL_TRADE_MODE) == SYMBOL_TRADE_MODE_DISABLED) continue;
        else
        {
            if ((OrderSymbol() != Symbol()) || (OrderMagicNumber() != sets.MagicNumber)) continue;
            if (OrderType() == OP_BUY)
            {
                double BE = NormalizeDouble(OrderOpenPrice() + sets.BreakEvenPoints * _Point, _Digits);
                if ((Bid >= BE) && (OrderOpenPrice() > OrderStopLoss())) // Only move to breakeven if the current stop-loss is lower.
                {
                    // Write Open price to the SL field.
                    if (!OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice(), OrderTakeProfit(), OrderExpiration()))
                        Print("OrderModify Buy BE failed " + ErrorDescription(GetLastError()) + ".");
                    else
                        Print("Breakeven was applied to position - " + Symbol() + " BUY-order #" + IntegerToString(OrderTicket()) + " Lotsize = " + DoubleToString(OrderLots(), LotStep_digits) + ", OpenPrice = " + DoubleToString(OrderOpenPrice(), _Digits) + ", Stop-Loss was moved from " + DoubleToString(OrderStopLoss(), _Digits) + ".");
                }
            }
            else if (OrderType() == OP_SELL)
            {
                double BE = NormalizeDouble(OrderOpenPrice() - sets.BreakEvenPoints * _Point, _Digits);
                if ((Ask <= BE) && ((OrderOpenPrice() < OrderStopLoss()) || (OrderStopLoss() == 0))) // Only move to breakeven if the current stop-loss is higher (or zero).
                {
                    // Write Open price to the SL field.
                    if (!OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice(), OrderTakeProfit(), OrderExpiration()))
                        Print("OrderModify Sell BE failed " + ErrorDescription(GetLastError()) + ".");
                    else
                        Print("Breakeven was applied to position - " + Symbol() + " SELL-order #" + IntegerToString(OrderTicket()) + " Lotsize = " + DoubleToString(OrderLots(), LotStep_digits) + ", OpenPrice = " + DoubleToString(OrderOpenPrice(), _Digits) + ", Stop-Loss was moved from " + DoubleToString(OrderStopLoss(), _Digits) + ".");
                }
            }
        }
    }
}
//+------------------------------------------------------------------+