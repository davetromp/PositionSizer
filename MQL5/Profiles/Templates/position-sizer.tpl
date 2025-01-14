<chart>
id=133245920477809681
symbol=GBPUSD
description=Great Britain Pound vs US Dollar
period_type=1
period_size=24
digits=5
tick_size=0.000000
position_time=1679882400
scale_fix=0
scale_fixed_min=1.177300
scale_fixed_max=1.245900
scale_fix11=0
scale_bar=0
scale_bar_val=1.000000
scale=16
mode=1
fore=0
grid=0
volume=0
scroll=1
shift=1
shift_size=20.042988
fixed_pos=0.000000
ticker=1
ohlc=1
one_click=0
one_click_btn=0
bidline=0
askline=0
lastline=0
days=0
descriptions=0
tradelines=1
tradehistory=1
window_left=22
window_top=22
window_right=1454
window_bottom=568
window_type=1
floating=0
floating_left=0
floating_top=0
floating_right=0
floating_bottom=0
floating_type=1
floating_toolbar=1
floating_tbstate=
background_color=16777215
foreground_color=0
barup_color=0
bardown_color=0
bullcandle_color=10135078
bearcandle_color=5264367
chartline_color=8698454
volumes_color=10135078
grid_color=15920369
bidline_color=10135078
askline_color=5264367
lastline_color=15776412
stops_color=5264367
windows_total=1

<expert>
name=Position Sizer
path=Experts\Position Sizer\Position Sizer.ex5
expertmode=33
<inputs>
=
ShowLineLabels=true
ShowAdditionalSLLabel=false
ShowAdditionalTPLabel=false
DrawTextAsBackground=false
PanelOnTopOfChart=true
HideAccSize=false
ShowPointValue=false
ShowMaxPSButton=false
StartPanelMinimized=false
ShowATROptions=false
=
sl_label_font_color=255
tp_label_font_color=32768
font_size=13
font_face=Courier
=
entry_line_color=16711680
stoploss_line_color=255
takeprofit_line_color=32768
stopprice_line_color=8388736
entry_line_style=0
stoploss_line_style=0
takeprofit_line_style=0
stopprice_line_style=2
entry_line_width=1
stoploss_line_width=1
takeprofit_line_width=1
stopprice_line_width=1
=
DefaultTradeDirection=0
DefaultSL=0
DefaultTP=0
DefaultEntryType=0
DefaultShowLines=true
DefaultLinesSelected=true
DefaultATRPeriod=14
DefaultATRMultiplierSL=0.0
DefaultATRMultiplierTP=0.0
DefaultATRTimeframe=0
DefaultSpreadAdjustmentSL=false
DefaultSpreadAdjustmentTP=false
DefaultCommission=0.0
DefaultAccountButton=0
DefaultRisk=1.0
DefaultMoneyRisk=0.0
DefaultCountPendingOrders=false
DefaultIgnoreOrdersWithoutStopLoss=false
DefaultIgnoreOtherSymbols=false
DefaultCustomLeverage=0
DefaultMagicNumber=2022052714
DefaultCommentary=
DefaultCommentAutoSuffix=false
DefaultDisableTradingWhenLinesAreHidden=false
DefaultMaxSlippage=0
DefaultMaxSpread=0
DefaultMaxEntrySLDistance=0
DefaultMinEntrySLDistance=0
DefaultMaxPositionSize=0.0
DefaultSubtractOPV=false
DefaultSubtractPOV=false
DefaultDoNotApplyStopLoss=false
DefaultDoNotApplyTakeProfit=false
DefaultAskForConfirmation=true
DefaultPanelPositionX=0
DefaultPanelPositionY=15
DefaultPanelPositionCorner=0
DefaultTPLockedOnSL=false
DefaultTrailingStop=0
DefaultBreakEven=0
DefaultMaxNumberOfTrades=0
DefaultAllSymbols=true
=
TP_Multiplier=1.0
UseCommissionToSetTPDistance=false
ShowSpread=false
AdditionalFunds=0.0
CustomBalance=0.0
SLDistanceInPoints=false
TPDistanceInPoints=false
ATRCandle=0
TakeProfitsNumber=1
CalculateUnadjustedPositionSize=false
RoundDown=true
QuickRisk1=0.0
QuickRisk2=0.0
ObjectPrefix=PS_
TradeHotKey=Shift+T
SymbolChangeReset=false
</inputs>
</expert>

<window>
height=100.000000
objects=159

<indicator>
name=Main
path=
apply=1
show_data=1
scale_inherit=0
scale_line=0
scale_line_percent=50
scale_line_value=0.000000
scale_fix_min=0
scale_fix_min_val=0.000000
scale_fix_max=0
scale_fix_max_val=0.000000
expertmode=0
fixed_height=-1
</indicator>
<object>
type=1
name=PS_EntryLine
color=16711680
selectable=0
value1=1.231520
</object>

<object>
type=1
name=PS_StopLossLine
value1=1.231030
</object>

<object>
type=1
name=PS_StopPriceLine
color=8388736
style=2
hide=1
value1=0.000000
</object>

<object>
type=102
name=04195m_LblEntryLevel
hidden=1
descr=Entry:
color=2631995
selectable=0
angle=0
pos_x=14
pos_y=81
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblEntryWarning
hidden=1
descr= 
color=2631995
selectable=0
angle=0
pos_x=239
pos_y=81
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSL
hidden=1
descr=Stop-loss:         
color=2631995
selectable=0
angle=0
pos_x=14
pos_y=105
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSLWarning
hidden=1
descr= 
color=2631995
selectable=0
angle=0
pos_x=239
pos_y=105
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblTPWarning
hidden=1
descr= 
color=2631995
selectable=0
angle=0
pos_x=239
pos_y=129
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblStopBBBPrice
hidden=1
descr=Stop price:       
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblStopPriceWarning
hidden=1
descr= 
color=2631995
selectable=0
hide=1
angle=0
pos_x=239
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblOrderType
hidden=1
descr=Order type:
color=2631995
selectable=0
angle=0
pos_x=14
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCommissionSize
hidden=1
descr=Commission (one-way) per lot:
color=2631995
selectable=0
angle=0
pos_x=14
pos_y=177
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblAdditionalFundsAsterisk
hidden=1
descr=*
color=2631995
selectable=0
hide=1
angle=0
pos_x=328
pos_y=201
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblInput
hidden=1
descr=Input
color=2631995
selectable=0
angle=0
pos_x=137
pos_y=225
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblResult
hidden=1
descr=Result
color=2631995
selectable=0
angle=0
pos_x=239
pos_y=225
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblRisk
hidden=1
descr=Risk, %:
color=2631995
selectable=0
angle=0
pos_x=14
pos_y=249
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblRiskM
hidden=1
descr=Risk, EUR:
color=2631995
selectable=0
angle=0
pos_x=14
pos_y=273
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblReward
hidden=1
descr=Reward, EUR:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=321
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblRR
hidden=1
descr=Reward/risk:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=345
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblPosSize
hidden=1
descr=Position size:
color=2631995
selectable=0
angle=0
pos_x=14
pos_y=297
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblURL
hidden=1
descr=www.davetromp.com
color=4354816
selectable=0
angle=0
pos_x=14
pos_y=321
fontsz=8
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCurrentRiskMoney
hidden=1
descr=Risk EUR
color=2631995
selectable=0
hide=1
angle=0
pos_x=128
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCurrentRiskPerc
hidden=1
descr=Risk %
color=2631995
selectable=0
hide=1
angle=0
pos_x=217
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCurrentLots
hidden=1
descr=Lots
color=2631995
selectable=0
hide=1
angle=0
pos_x=286
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCurrentPortfolio
hidden=1
descr=Current portfolio:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=177
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCurrentProfitMoney
hidden=1
descr=Reward EUR
color=2631995
selectable=0
hide=1
angle=0
pos_x=128
pos_y=201
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCurrentProfitPerc
hidden=1
descr=Reward %
color=2631995
selectable=0
hide=1
angle=0
pos_x=217
pos_y=201
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblPotentialRiskMoney
hidden=1
descr=Risk EUR
color=2631995
selectable=0
hide=1
angle=0
pos_x=128
pos_y=249
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblPotentialRiskPerc
hidden=1
descr=Risk %
color=2631995
selectable=0
hide=1
angle=0
pos_x=217
pos_y=249
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblPotentialLots
hidden=1
descr=Lots
color=2631995
selectable=0
hide=1
angle=0
pos_x=286
pos_y=249
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblPotentialPortfolio
hidden=1
descr=Potential portfolio:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=273
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblPotentialProfitMoney
hidden=1
descr=Reward EUR
color=2631995
selectable=0
hide=1
angle=0
pos_x=128
pos_y=297
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblPotentialProfitPerc
hidden=1
descr=Reward %
color=2631995
selectable=0
hide=1
angle=0
pos_x=217
pos_y=297
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblPosMargin
hidden=1
descr=Position margin:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=81
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblUsedMargin
hidden=1
descr=Future used margin:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=105
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblFreeMargin
hidden=1
descr=Future free margin:
color=3877160
selectable=0
hide=1
angle=0
pos_x=14
pos_y=129
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCustomLeverage
hidden=1
descr=Custom leverage =         1:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblAccLeverage
hidden=1
descr=(Default = 1:30)
color=2631995
selectable=0
hide=1
angle=0
pos_x=197
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSymbolLeverage
hidden=1
descr=(Symbol = 1:1)
color=2631995
selectable=0
hide=1
angle=0
pos_x=197
pos_y=177
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblMaxPositionSizeByMargin
hidden=1
descr=Maximum position size by margin:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=201
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsType
hidden=1
descr=Type:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=81
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsTripleDay
hidden=1
descr=Triple swap:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=105
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsLong
hidden=1
descr=Long
color=2631995
selectable=0
hide=1
angle=0
pos_x=69
pos_y=129
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsShort
hidden=1
descr=Short
color=2631995
selectable=0
hide=1
angle=0
pos_x=149
pos_y=129
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsNominal
hidden=1
descr=Nominal:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsDaily
hidden=1
descr=Daily:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=177
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsPerLotDaily
hidden=1
descr= 
color=2631995
selectable=0
hide=1
angle=0
pos_x=229
pos_y=177
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsPerPSDaily
hidden=1
descr= 
color=2631995
selectable=0
hide=1
angle=0
pos_x=229
pos_y=201
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsYearly
hidden=1
descr=Yearly:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=225
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsPerLotYearly
hidden=1
descr= 
color=2631995
selectable=0
hide=1
angle=0
pos_x=229
pos_y=225
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblSwapsPerPSYearly
hidden=1
descr= 
color=2631995
selectable=0
hide=1
angle=0
pos_x=229
pos_y=249
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblTrailingStop
hidden=1
descr=Trailing stop:
color=2631995
selectable=0
hide=1
angle=0
pos_x=72
pos_y=81
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblBreakEven
hidden=1
descr=Breakeven:
color=2631995
selectable=0
hide=1
angle=0
pos_x=219
pos_y=81
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblMagicNumber
hidden=1
descr=Magic number:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=105
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblCommentary
hidden=1
descr=Order commentary:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=129
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblMaxNumberOfTrades
hidden=1
descr=Max # of trades:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=153
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblTradingPoints
hidden=1
descr=Points
color=2631995
selectable=0
hide=1
angle=0
pos_x=157
pos_y=201
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblMaxSlippage
hidden=1
descr=Max slippage:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=225
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblMaxSpread
hidden=1
descr=Max spread:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=249
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblMaxEntrySLDistance
hidden=1
descr=Max Entry/SL distance:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=273
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblMinEntrySLDistance
hidden=1
descr=Min Entry/SL distance:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=297
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblTradingLots
hidden=1
descr=Lots
color=2631995
selectable=0
hide=1
angle=0
pos_x=157
pos_y=321
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=102
name=04195m_LblMaxPositionSize
hidden=1
descr=Max position size:
color=2631995
selectable=0
hide=1
angle=0
pos_x=14
pos_y=345
fontsz=10
fontnm=Trebuchet MS
anchorpos=0
refpoint=0
</object>

<object>
type=1
name=PS_DummyObject
hidden=1
selectable=0
value1=0.000000
</object>

<object>
type=102
name=PS_StopLossLabel
descr=49
selectable=0
angle=0
pos_x=1842
pos_y=161
fontsz=13
fontnm=Courier
anchorpos=0
refpoint=0
</object>

<object>
type=1
name=PS_TakeProfitLine
color=32768
hide=1
value1=0.000000
</object>

<object>
type=102
name=PS_TakeProfitLabel
color=-1
selectable=0
hide=1
angle=0
pos_x=0
pos_y=0
fontsz=10
fontnm=Arial
anchorpos=0
refpoint=0
</object>

<object>
type=1
name=PS_DummyObject2
hidden=1
selectable=0
value1=0.000000
</object>

</window>
</chart>