//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                                  Copyright © 2023, DaveTromp.com |
//|                                       https://www.davetromp.com/ |
//+------------------------------------------------------------------+
#include <Controls\Button.mqh>
#include <Controls\Dialog.mqh>
#include <Controls\CheckBox.mqh>
#include <Controls\Label.mqh>

#define CONTROLS_EDIT_COLOR_ENABLE  C'255,255,255'
#define CONTROLS_EDIT_COLOR_DISABLE C'221,221,211'

#define CONTROLS_BUTTON_COLOR_ENABLE  C'200,200,200'
#define CONTROLS_BUTTON_COLOR_DISABLE C'224,224,224'

enum ENTRY_TYPE
{
    Instant,
    Pending,
    StopLimit // Stop Limit
};

enum ACCOUNT_BUTTON
{
    Balance,
    Equity,
    Balance_minus_Risk // Balance - Risk
};

enum TABS
{
    MainTab,
    RiskTab,
    MarginTab,
    SwapsTab,
    TradingTab
};

enum TRADE_DIRECTION
{
    Long,
    Short
};

enum PROFIT_LOSS
{
    Profit,
    Loss
};

enum CANDLE_NUMBER
{
    Current_Candle = 0, // Current candle
    Previous_Candle = 1 // Previous candle
};

struct Settings
{
    ENTRY_TYPE EntryType;
    double EntryLevel;
    double StopLossLevel;
    double TakeProfitLevel;
    double StopPriceLevel;
    double Risk;
    double MoneyRisk;
    double CommissionPerLot;
    bool UseMoneyInsteadOfPercentage;
    bool RiskFromPositionSize;
    double PositionSize; // Used only when RiskFromPositionSize == true.
    ACCOUNT_BUTTON AccountButton;
    double CustomBalance;
    bool DeleteLines;
    bool CountPendingOrders;
    bool IgnoreOrdersWithoutStopLoss;
    bool IgnoreOtherSymbols;
    bool HideAccSize;
    bool ShowLines;
    TABS SelectedTab;
    int CustomLeverage;
    int MagicNumber;
    string Commentary;
    bool DisableTradingWhenLinesAreHidden;
    double TP[];
    int TPShare[];
    int MaxSlippage;
    int MaxSpread;
    int MaxEntrySLDistance;
    int MinEntrySLDistance;
    double MaxPositionSize;
    // For SL/TP distance modes:
    int StopLoss;
    int TakeProfit;
    // Only for SL distance mode:
    TRADE_DIRECTION TradeDirection;
    // For Trading only:
    bool SubtractPositions;
    bool SubtractPendingOrders;
    bool DoNotApplyStopLoss;
    bool DoNotApplyTakeProfit;
    bool AskForConfirmation;
    bool CommentAutoSuffix;
    int TrailingStopPoints;
    int BreakEvenPoints;
    int MaxNumberOfTrades;
    bool AllSymbols;
    // For ATR:
    int ATRPeriod;
    double ATRMultiplierSL;
    double ATRMultiplierTP;
    ENUM_TIMEFRAMES ATRTimeframe;
    bool SpreadAdjustmentSL;
    bool SpreadAdjustmentTP;
    // Remembering which lines have been selected:
    bool WasSelectedEntryLine;
    bool WasSelectedStopLossLine;
    bool WasSelectedTakeProfitLine;
    bool WasSelectedStopPriceLine;
    bool WasSelectedAdditionalTakeProfitLine[];
    // Panel states:
    bool IsPanelMinimized;
    bool TPLockedOnSL;
} sets;
//+------------------------------------------------------------------+