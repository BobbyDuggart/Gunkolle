#Include %A_ScriptDir%/Functions/Mouse.ahk

RunMap(x)
{
	if (x == "0_2")
	{
		0_2()
	}
	else if(x == "4_6_data")
	{
		4_6_data()
	}
	else if(x == "4_3E")
	{
		4_3E()
	}
	else if(x == "5_4_friendly")
	{
		5_4_friendly()
	}
	else if(x == "6_3N")
	{
		6_3N()
	}
	else if(x == "6_3N_airstrike")
	{
		6_3N_airstrike()
	}
	else if(x == "8_1N")
	{
		8_1N()
	}
	else if(x == "8_1N_airstrike")
	{
		8_1N_airstrike()
	}
	else if(x == "10_4E")
	{
		10_4E()
	}
	else if(x == "10_4Ecdo")
	{
		10_4Ecdo()
	}
	else if(x == "11_5")
	{
		11_5()
	}
	else if(x == "E1_1")
	{
		E1_1()
	}
	else if(x == "E1_2")
	{
		E1_2()
	}
	else if(x == "E2_1")
	{
		E2_1()
	}
}

WaitBattle()
{
	GuiControl,, NB, In Battle
	FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o30 Count1 n0 w30000,50")
	sleep 7500
	Loop
	{		
		Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
		if Found >= 1
		{
			GuiControl,, NB, Finished battle
			break
		}
		else
		{
			;Safex, Safey dont click in a valid position
			ClickS(700,400)
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "rLDPlayer mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				break
			}
		}
	}
}

WaitTurn(turn)
{
	Global
	GuiControl,, NB, Waiting Turn %turn%
	loop
	{
		Found := FindClick(A_ScriptDir "\pics\Turn" turn, "rLDPlayer mc o30 Count1 n0 w1000")
		if Found >= 1
		{
			break
		}
		else
		{
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "rLDPlayer mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				GuiControl,, NB, SF moving
			}
			else
			{
				WaitBattle()
			}	
		}		
	}
	GuiControl,, NB, G&K turn started
	TFindClick("Planning", "PlanningReady")
}

WaitExecution()
{
	Global
	loop
	{		
		Found := FindClick(A_ScriptDir "\pics\Planning", "rLDPlayer mc o30 Count1 n0 w5000")
		if Found >= 1
		{
			break
		}
		else
		{
			EndTurnFound := FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o30 Count1 n0 w1000")
			if EndTurnFound >= 1 
			{
				GuiControl,, NB, Executing Plan			
			}
			else
			{
				WaitBattle()
			}
		}		
	}
}

nodes(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,400)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, Waiting for next action
	}
}

eventnodes(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,125)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, Waiting for next action
	}
}

nodeboss(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
			if Found >= 1
			{
			}
			else
			{
				sleep 50
				;ClickS(Safex,Safey)
				ClickS(700,125)
			}
			GuiControl,, NB, Waiting for end of combat = %found%
		}
		GuiControl,, NB, Waiting for next action
	}
}

;GoHome()
;{
;	Global
;	RetirementLoop := 1
;	loop, %RetirementLoop%
;	{
;		Found1 := 0
;		Found2 := 0
;		Found3 := 0
;		sleep 5000
;		while(Found1 == 0 && Found2 == 0)
;		{
;			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
;			Found2 := FindClick(A_ScriptDir "\pics\DailyMessage", "rLDPlayer mc o40 Count1 n0")
;			if (Found1 >= 1 or Found2 >= 1)
;			{
;
;			}
;			else
;			{
;				Found3 := FindClick(A_ScriptDir "\pics\CombatReturn", "rLDPlayer mc o40 Count1 w100,50")
;				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
;				if FoundExp >= 1
;				{
;					RetirementLoop++
;				}
;				ClickS(Homex+52,Homey)
;			}
;			GuiControl,, NB, %found1% %found2% %found3% 
;		}
;	}
;}

GoHome()
{
	Global
	RetirementLoop := 1
	loop, %RetirementLoop%
	{
		Found1 := 0
		Found2 := 0
		;Found3 := 0
		sleep 4000
		while(Found1 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
			if (Found1 >= 1)
			{

			}
			else
			{
                sleep 250
				Found2 := FindClick(A_ScriptDir "\pics\CombatReturn", "rLDPlayer mc o40 Count1 w100,50")
				;Found3 := FindClick(A_ScriptDir "\pics\CombatReturnEvent", "rLDPlayer mc o40 Count1 w100,50")
				FoundLogin := FindClick(A_ScriptDir "\pics\LoginCollectNotice", "rLDPlayer mc o40 Count1 n0")
				if FoundLogin >= 1
					{
						GuiControl,, NB, Login Collect Found
						TFindClick("LoginCollectNotice","LoginCollectNotice2")
						sleep 1000
						RFindClick("LoginCollectNotice2", "rLDPlayer mc o50 w30000,50")
						sleep 500
						Found2Backup := FindClick(A_ScriptDir "\pics\LoginCollectNotice2", "rLDPlayer mc o40 Count1 n1")
						sleep 5000
						FoundDrop := FindClick(A_ScriptDir "\pics\DollDrop", "rLDPlayer mc o40 Count1 n0")
						if (FoundDrop == true)
							{
								ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
							}
						sleep 250
						FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "rLDPlayer mc o40 Count1 n0 w500")
						if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
						}
						FoundCollect := FindClick(A_ScriptDir "\pics\LoginCollectNotice3", "rLDPlayer mc o40 Count1 n1")
						sleep 500
						FoundCollect := FindClick(A_ScriptDir "\pics\LoginCollectNotice3", "rLDPlayer mc o40 Count1 n1")
						sleep 5000
						FoundDrop := FindClick(A_ScriptDir "\pics\DollDrop", "rLDPlayer mc o40 Count1 n0")
						if (FoundDrop == true)
							{
								ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
							}
						sleep 250
						FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "rLDPlayer mc o40 Count1 n0 w500")
						if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
						}
						FoundCollect := FindClick(A_ScriptDir "\pics\LoginCollectNotice3", "rLDPlayer mc o40 Count1 n1")
						sleep 500
						FoundCollect := FindClick(A_ScriptDir "\pics\LoginCollectNotice3", "rLDPlayer mc o40 Count1 n1")
						sleep 500
						RFindClick("LoginCollectNotice4", "rLDPlayer mc o30 w30000,50")
					}
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
				if FoundExp >= 1
				{
					;sleep 1000
					RetirementLoop++
				}
				ClickS(765, 130)
			}
			GuiControl,, NB, Waiting for base = %found1% %found2%
		}
	}
}

GoHomeEvent()
{
	Global
	RetirementLoop := 1
	loop, %RetirementLoop%
	{
		Found1 := 0
		Found2 := 0
		;Found3 := 0
		sleep 4000
		while(Found1 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
			if (Found1 >= 1)
			{

			}
			else
			{
                sleep 250
				Found2 := FindClick(A_ScriptDir "\pics\CombatReturnEvent", "rLDPlayer mc o40 Count1 w100,50")
				FoundLogin := FindClick(A_ScriptDir "\pics\LoginCollectNotice", "rLDPlayer mc o40 Count1 n0")
				if FoundLogin >= 1
					{
						GuiControl,, NB, Login Collect Found
						TFindClick("LoginCollectNotice","LoginCollectNotice2")
						sleep 1000
						RFindClick("LoginCollectNotice2", "rLDPlayer mc o50 w30000,50")
						sleep 500
						Found2Backup := FindClick(A_ScriptDir "\pics\LoginCollectNotice2", "rLDPlayer mc o40 Count1 n1")
						sleep 5000
						FoundDrop := FindClick(A_ScriptDir "\pics\DollDrop", "rLDPlayer mc o40 Count1 n0")
						if (FoundDrop == true)
							{
								ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
							}
						sleep 250
						FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "rLDPlayer mc o40 Count1 n0 w500")
						if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
						}
						FoundCollect := FindClick(A_ScriptDir "\pics\LoginCollectNotice3", "rLDPlayer mc o40 Count1 n1")
						sleep 500
						FoundCollect := FindClick(A_ScriptDir "\pics\LoginCollectNotice3", "rLDPlayer mc o40 Count1 n1")
						sleep 5000
						FoundDrop := FindClick(A_ScriptDir "\pics\DollDrop", "rLDPlayer mc o40 Count1 n0")
						if (FoundDrop == true)
							{
								ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
							}
						sleep 250
						FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "rLDPlayer mc o40 Count1 n0 w500")
						if (FoundAchievement == true)
						{
							GuiControl,, NB, Achievement Found
							ClickS(130, 300)
						}
						FoundCollect := FindClick(A_ScriptDir "\pics\LoginCollectNotice3", "rLDPlayer mc o40 Count1 n1")
						sleep 500
						FoundCollect := FindClick(A_ScriptDir "\pics\LoginCollectNotice3", "rLDPlayer mc o40 Count1 n1")
						sleep 500
						RFindClick("LoginCollectNotice4", "rLDPlayer mc o30 w30000,50")
					}
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
				if FoundExp >= 1
				{
					RetirementLoop++
				}
				ClickS(165, 328)
			}
			GuiControl,, NB, Waiting for base = %found1% %found2%
		}
	}
}

0_2()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(725, 430)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(649, 401)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(455, 395)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, Heliport
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(455, 395)
			sleep 200
			ClickS(455, 395)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1000
	ClickS(649, 401)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 500
	ClickS(582, 99)
	GuiControl,, NB, Plan2
	sleep 500
	ClickS(814, 115)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	sleep 2000 ;need it, otherwise 'illegal action' window will pop
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

4_6_data()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2800
		DragDownToUp(500, 675, 350)
		sleep 500
		ClickS(750, 625)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Loop, 9
	{
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		sleep 1500
		GuiControl,, NB, CommandPost
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(842, 400)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
		RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
		sleep 250
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0 w250")
		sleep 250
		GuiControl,, NB, Heliport
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(868, 46)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
		RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
		sleep 250
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0 w250")
		sleep 250
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport
		while(FindClick(A_ScriptDir "\pics\CommandFairy", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(868, 46)
			sleep 1000
		}
		GuiControl,, NB, Node1
		sleep 500
		ClickS(858, 109)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 109)
					sleep 200
					ClickS(858, 109)
					sleep 3000
					GuiControl,, NB, Pause
					while(FindClick(A_ScriptDir "\pics\CombatPaused", "rLDPlayer mc o25 Count1 n0") = 0)
						{
							ClickS(640, 51)
							sleep 1000
						}
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateRestart")
					sleep 750
					ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(810, 185)
					sleep 500
					ClickS(810, 185)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node2
		ClickS(810, 185)
		sleep 150
		ClickS(810, 185)
		sleep 1500
		GuiControl,, NB, Node3
		ClickS(745, 233)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(745, 233)
					sleep 200
					ClickS(745, 233)
					sleep 3000
					while(FindClick(A_ScriptDir "\pics\CombatPaused", "rLDPlayer mc o25 Count1 n0") = 0)
						{
							ClickS(640, 51)
							sleep 1000
						}
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateRestart")
					sleep 750
					ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(818, 260)
					sleep 500
					ClickS(818, 260)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node4
		ClickS(818, 260)
		sleep 150
		ClickS(818, 260)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(818, 260)
					sleep 200
					ClickS(818, 260)
					sleep 3000
					while(FindClick(A_ScriptDir "\pics\CombatPaused", "rLDPlayer mc o25 Count1 n0") = 0)
						{
							ClickS(640, 51)
							sleep 1000
						}
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateRestart")
					sleep 750
					ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
					continue
				}		
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(818, 260)
					sleep 500
					ClickS(818, 260)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		ClickS(320, 180)
		sleep 250
		TFindClick("Terminate","TerminateRestart")
		sleep 750
		ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
	}
	Loop, 1
	{
		GuiControl,, NB, Last reset
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		sleep 1500
		GuiControl,, NB, CommandPost
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(842, 400)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
		RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
		sleep 250
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0 w250")
		sleep 250
		GuiControl,, NB, Heliport
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(868, 46)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
		RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
		sleep 250
		Found := FindClick(A_ScriptDir "\pics\OK", "rLDPlayer mc o40 Count1 n0 w250")
		sleep 250
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport
		while(FindClick(A_ScriptDir "\pics\CommandFairy", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(868, 46)
			sleep 1000
		}
		GuiControl,, NB, Node1
		sleep 500
		ClickS(858, 109)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(858, 109)
					sleep 200
					ClickS(858, 109)
					sleep 3000
					while(FindClick(A_ScriptDir "\pics\CombatPaused", "rLDPlayer mc o25 Count1 n0") != 1)
						{
							ClickS(640, 51)
							sleep 1000
						}
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateOK")
					sleep 750
					ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(810, 185)
					sleep 500
					ClickS(810, 185)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node2
		ClickS(810, 185)
		sleep 150
		ClickS(810, 185)
		sleep 1500
		GuiControl,, NB, Node3
		ClickS(745, 233)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(745, 233)
					sleep 200
					ClickS(745, 233)
					sleep 3000
					while(FindClick(A_ScriptDir "\pics\CombatPaused", "rLDPlayer mc o25 Count1 n0") != 1)
						{
							ClickS(640, 51)
							sleep 1000
						}
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateOK")
					sleep 750
					ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
					continue
				}	
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(818, 260)
					sleep 500
					ClickS(818, 260)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		GuiControl,, NB, Node4
		ClickS(818, 260)
		sleep 150
		ClickS(818, 260)
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Ambush", "rLDPlayer mc o40 Count1 n0 w1500")
			if (FoundBattle == true)
				{
					ClickS(818, 260)
					sleep 200
					ClickS(818, 260)
					sleep 3000
					while(FindClick(A_ScriptDir "\pics\CombatPaused", "rLDPlayer mc o25 Count1 n0") != 1)
						{
							ClickS(640, 51)
							sleep 1000
						}
					GuiControl,, NB, Withdraw
					ClickS(426, 66)
					sleep 1500
					ClickS(800, 200)
					sleep 1500
					TFindClick("Terminate","TerminateOK")
					sleep 750
					ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
					continue
				}		
		FoundDrop := FindClick(A_ScriptDir "\pics\Maps\4_6\DollNode", "rLDPlayer mc o40 Count1 n0")
			if (FoundDrop == true)
				{
					ClickS(818, 260)
					sleep 500
					ClickS(818, 260)
					ClickTilGone("DollDrop", "rLDPlayer mc o10 w30000,50 ")
				}
		ClickS(320, 180)
		sleep 250
		TFindClick("Terminate","TerminateOK")
		sleep 750
		ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	}
	GoHome()
}

4_3E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(725, 548)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(855, 460)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, CommandPost
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(434, 400)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(434, 400)
			sleep 200
			ClickS(434, 400)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	GuiControl,, NB, Heliport
	sleep 1000
	ClickS(855, 460)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(838, 126)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(4)
	sleep 2000 ;need it, otherwise 'illegal action' window will pop
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

5_4_friendly()
{
	Global
	GuiControl,, NB, MapSelect
	sleep 2000
	ClickS(716, 664)
	RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	if Found >= 1
	{
	}
	Else
	{
		GuiControl,, NB, Can't find map, Paused.
		Pause
	}
	while (true)
	{
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		GuiControl,, NB, CommandPost
		sleep 2000
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(840, 330)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
		RFindClick("OK", "rLDPlayer mc o10 w30000,50")
		sleep 500
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		GuiControl,, NB, Heliport1
		sleep 2000
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(425, 350)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
		RFindClick("Maps\5_4\Support", "rLDPlayer mc o50 w30000,50 ")  
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		RFindClick("Maps\5_4\SupportFriend", "rLDPlayer mc o50 w30000,50 ")
		sleep 500
		RFindClick("OK", "rLDPlayer mc o20 w30000,50")
		GuiControl,, NB, Heliport2
		sleep 1000
		while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(425, 560)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
		RFindClick("Maps\5_4\Support", "rLDPlayer mc o50 w30000,50 ")  
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		RFindClick("Maps\5_4\SupportFriend", "rLDPlayer mc o50 w30000,50 ")
		sleep 500
		RFindClick("OK", "rLDPlayer mc o20 w30000,50")
		sleep 500
		TFindClick("Terminate","TerminateRestart")
		sleep 500
		ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	}
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\FriendsDone", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		Else
		{
			sleep 500
			TFindClick("Terminate","TerminateRestart")
			sleep 500
			ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
		}
}

6_3N()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(715, 550)
		RFindClick("Battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 1500
	ClickS(522, 372)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(522, 372)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 1500
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 18000 ;need it
	GuiControl,, NB, Heliport2
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon3", "rLDPlayer mc o60 w30000,50 ")
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 1000
	ClickS(750, 378)
	GuiControl,, NB, Echelon3
	sleep 500
	ClickS(706, 425)
	sleep 1000
	RFindClick("\Maps\6_3N\Switch", "rLDPlayer mc o60 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 2200
	ClickS(706, 425)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateRestart")
	sleep 500
	ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 2000
	ClickS(522, 372)
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(522, 372)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 1500
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 18000 ;need it
	GuiControl,, NB, Heliport2
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon3", "rLDPlayer mc o60 w30000,50 ")
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 1000
	ClickS(750, 378)
	GuiControl,, NB, Echelon3
	sleep 500
	ClickS(706, 425)
	sleep 1000
	RFindClick("\Maps\6_3N\Switch", "rLDPlayer mc o60 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 2200
	ClickS(706, 425)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	GuiControl,, NB, Heliport2
	ClickS(695, 370)
	sleep 1000
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon2", "rLDPlayer mc o30 w2000,50")
	sleep 500
	RFindClick("OK", "rLDPlayer mc o30 w30000,50")
	sleep 1000
	GuiControl,, NB, Echelon2
	ClickS(706, 425)
	sleep 500
	ClickS(706, 425)
	sleep 500
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 500
	GuiControl,, NB, Echelon2
	ClickS(706, 425)
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

6_3N_airstrike()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(715, 550)
		RFindClick("Battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		RetirementLoop--
	}
	Loop, 4
	{
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\AutoFairyOff", "rLDPlayer mc o30 Count1 w500,50")
		Found := FindClick(A_ScriptDir "\Maps\6_3N\LowFairyCommand", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
		GuiControl,, NB, Heliport
		ClickS(522, 372)
		sleep 500
		RFindClick("OK", "rLDPlayer mc o5 w30000,50")
		sleep 500
		RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		GuiControl,, NB, Heliport
		ClickS(522, 372)
		sleep 500
		RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
		GuiControl,, NB, Plan
		sleep 500
		ClickS(750, 378)
		sleep 500
		RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w4000,50")
		nodes(1)
		Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
		nodes(1)
		sleep 500
		TFindClick("Terminate","TerminateRestart")
		sleep 500
		ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\AutoFairyOff", "rLDPlayer mc o30 Count1 w500,50")
	Found := FindClick(A_ScriptDir "\Maps\6_3N\LowFairyCommand", "rLDPlayer mc o30 Count1 n0 w500,50")
	if(Found == 1)
	{
		RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
		GuiControl,, NB, Fairy command is low, Paused
		pause
	}
	GuiControl,, NB, Heliport
	ClickS(522, 372)
	sleep 500
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
	if(Found == 1)
	{
		GuiControl,, NB, Max equipment, Paused
		pause
	}
	GuiControl,, NB, Heliport
	ClickS(522, 372)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w4000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

8_1N()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(820, 315)
		RFindClick("Battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(412, 480)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1000
	GuiControl,, NB, Heliport2
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(850, 478)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1000
	GuiControl,, NB, Heliport3
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(442, 225)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(412, 480)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(395, 306)
	sleep 500
	ClickS(485, 288)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	sleep 1500
	GuiControl,, NB, Echelon1
	ClickS(485, 365)
	GuiControl,, NB, Echelon3
	sleep 500
	ClickS(442, 300)
	sleep 1000
	RFindClick("\Maps\8_1N\Switch", "rLDPlayer mc o60 w30000,50 ")
	GuiControl,, NB, Echelon1
	Sleep 2200
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(442, 300)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 1000
	ClickS(886, 575)
	sleep 200
	GuiControl,, NB, Echelon2
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(850, 549)
			sleep 200
			ClickS(850, 549)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	ClickS(850, 549)
	sleep 500
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

8_1N_airstrike()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(820, 315)
		RFindClick("Battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\AutoFairyOff", "rLDPlayer mc o30 Count1 w500,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\8_1N\LowFairyCommand", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
	Found := FindClick(A_ScriptDir "\pics\Maps\8_1N\LowFairyCommand2", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(412, 480)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(412, 480)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(395, 306)
	sleep 500
	ClickS(485, 288)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w4000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	sleep 500
	TFindClick("Terminate","TerminateRestart")
	sleep 500
	ClickTilGone("TerminateRestart", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\AutoFairyOff", "rLDPlayer mc o30 Count1 w500,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\8_1N\LowFairyCommand", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
	Found := FindClick(A_ScriptDir "\pics\Maps\8_1N\LowFairyCommand2", "rLDPlayer mc o30 Count1 n0 w500,50")
		if(Found == 1)
		{
			RFindClick("AutoFairyOn", "rLDPlayer mc o5 w30000,50")
			GuiControl,, NB, Fairy command is low, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(412, 480)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o5 w30000,50")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\CombatEquipEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			GuiControl,, NB, Max equipment, Paused
			pause
		}
	GuiControl,, NB, Heliport1
	ClickS(412, 480)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(395, 306)
	sleep 500
	ClickS(485, 288)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w4000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	Found := FindClick(A_ScriptDir "\pics\Exhausted", "rLDPlayer mc o30 Count1 n1 w3000,50")
	nodes(1)
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

10_4E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(720, 660)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(486, 232)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, CommandPost
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(576, 397)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport2
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(855, 737)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(576, 397)
			sleep 200
			ClickS(576, 397)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(576, 397)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("Retreat", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport1
	sleep 500
	ClickS(486, 175)
	sleep 1000
	ClickS(486, 232)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 500
	ClickS(420, 330)
	GuiControl,, NB, Plan2
	sleep 500
	ClickS(570, 196)
	GuiControl,, NB, Plan3
	sleep 500
	ClickS(626, 234)
	GuiControl,, NB, Plan4
	sleep 500
	ClickS(486, 232)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	GuiControl,, NB, Heliport1
	sleep 15000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(486, 398)
			sleep 200
			ClickS(486, 398)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("Retreat", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

10_4Ecdo()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2000
		ClickS(720, 660)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport1
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(486, 232)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, CommandPost
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(576, 397)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport2
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(855, 737)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, Heliport1
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(486, 232)
			sleep 200
			ClickS(486, 232)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 500
	ClickS(420, 330)
	GuiControl,, NB, Plan2
	sleep 500
	ClickS(570, 196)
	GuiControl,, NB, Plan3
	sleep 500
	ClickS(626, 234)
	GuiControl,, NB, Plan4
	sleep 500
	ClickS(486, 232)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	GuiControl,, NB, Heliport1
	sleep 15000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(486, 398)
			sleep 200
			ClickS(486, 398)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("Retreat", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

11_5()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		GuiControl,, NB, MapSelect
		sleep 2800
		DragDownToUp(500, 675, 350)
		sleep 500
		ClickS(750, 507)
		RFindClick("Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, Heliport 1
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(626, 448)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Heliport 2
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(626, 487)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, CommandPost
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(576, 487)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, Heliport 2
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(626, 487)
			sleep 200
			ClickS(626, 487)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(626, 487)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 1000
	ClickS(626, 448)
	sleep 200
	ClickS(626, 448)
	sleep 500
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan1
	sleep 500
	ClickS(523, 447)
	GuiControl,, NB, Plan2
	sleep 500
	ClickS(575, 484)
	sleep 1000
	RFindClick("\Maps\11_5\Move", "rLDPlayer mc o30 w30000,50")
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	sleep 4000
	GuiControl,, NB, Echelon 1
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(575, 485)
			sleep 200
			ClickS(575, 485)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

E1_1()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\DJMax\Glory", "rLDPlayer mc o30 w30000,50")
		FindClick(A_ScriptDir "\pics\Maps\DJMax\EventPage", "rLDPlayer mc o50 Count1 n0 w30000,50")
		RFindClick("\Maps\DJMax\Stalker", "rLDPlayer mc o30 w30000,50")
		RFindClick("\Maps\DJMax\ConfirmStart", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(662, 362)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(662, 362)
			sleep 200
			ClickS(662, 362)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(607, 612)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(3)
	eventnodes(1)
	sleep 1000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHomeEvent()
}

E1_2()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\DJMax\Glory", "rLDPlayer mc o30 w30000,50")
		FindClick(A_ScriptDir "\pics\Maps\DJMax\EventPage", "rLDPlayer mc o50 Count1 n0 w30000,50")
		RFindClick("\Maps\DJMax\Heartbeat", "rLDPlayer mc o30 w30000,50")
		RFindClick("\Maps\DJMax\ConfirmStart", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(406, 396)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(406, 396)
			sleep 200
			ClickS(406, 396)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(624, 501)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(3)
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 11000
	GuiControl,, NB, Echelon 1
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(626, 486)
			sleep 200
			ClickS(626, 486)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(865, 321)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	eventnodes(1)
	sleep 7000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHomeEvent()
}

E2_1()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\DJMax\Glory", "rLDPlayer mc o30 w30000,50")
		FindClick(A_ScriptDir "\pics\Maps\DJMax\EventPage", "rLDPlayer mc o50 Count1 n0 w30000,50")
		RFindClick("\Maps\DJMax\Sunset", "rLDPlayer mc o30 w30000,50")
		RFindClick("\Maps\DJMax\ConfirmStart", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	GuiControl,, NB, CommandPost
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(663, 396)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartOperation", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	GuiControl,, NB, CommandPost
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(663, 396)
			sleep 200
			ClickS(663, 396)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	GuiControl,, NB, Move 1
	ClickS(665, 331)
	sleep 2000
	ClickS(699, 362)
	GuiControl,, NB, CommandPost
	sleep 500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(663, 396)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(663, 396)
			sleep 200
			ClickS(663, 396)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	ClickTilGone("Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	GuiControl,, NB, Plan
	sleep 500
	ClickS(746, 397)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	eventnodes(3)
	sleep 1000
	GuiControl,, NB, CommandPost
	sleep 1500
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(663, 396)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	ClickS(746, 397)
	sleep 500
	ClickS(663, 396)
	sleep 500
	RFindClick("\Maps\DJMax\Switch", "rLDPlayer mc o60 w30000,50 ")
	GuiControl,, NB, Echelon 2
	sleep 2000
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(663, 396)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	GuiControl,, NB, Echelon 1
	ClickS(665, 331)
	sleep 200
	while(FindClick(A_ScriptDir "\pics\EchelonFormation", "rLDPlayer mc o25 Count1 n0") != 1)
		{
			ClickS(665, 331)
			sleep 200
			ClickS(665, 331)
			sleep 1000
			Found := FindClick(A_ScriptDir "\pics\Close", "rLDPlayer mc o30 Count1 n1 ,50")
		}
	RFindClick("Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("RetreatConfirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	TFindClick("Terminate","TerminateOK")
	sleep 500
	ClickTilGone("TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHomeEvent()
}