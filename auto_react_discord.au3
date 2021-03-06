#include <array.au3>

Global $bot_token = 'OTI4MTk5NjE1MTQ3Mjk4ODE2.YdVTQQ.AWMhWY8mnqG4C19gFeJsZqj0jf8'
Global $oHTTP = ObjCreate('WinHttp.WinHttpRequest.5.1')

Func _convert_word_to_emoji($content_index)
	Switch($content_index)
		Case 'a'
			Return 'ð¦'
		Case 'b'
			Return 'ð§'
		Case 'c'
			Return 'ð¨'
		Case 'd'
			Return 'ð©'
		Case 'e'
			Return 'ðª'
		Case 'f'
			Return 'ð«'
		Case 'g'
			Return 'ð¬'
		Case 'h'
			Return 'ð­'
		Case 'i'
			Return 'ð®'
		Case 'j'
			Return 'ð¯'
		Case 'k'
			Return 'ð°'
		Case 'l'
			Return 'ð±'
		Case 'm'
			Return 'ð²'
		Case 'n'
			Return 'ð³'
		Case 'o'
			Return 'ð´'
		Case 'p'
			Return 'ðµ'
		Case 'q'
			Return 'ð¶'
		Case 'r'
			Return 'ð·'
		Case 's'
			Return 'ð¸'
		Case 't'
			Return 'ð¹'
		Case 'u'
			Return 'ðº'
		Case 'v'
			Return 'ð»'
		Case 'w'
			Return 'ð¼'
		Case 'x'
			Return 'ð½'
		Case 'y'
			Return 'ð¾'
		Case 'z'
			Return 'ð¿'
		Case 1
			Return '1ï¸â£'
		Case 2
			Return '2ï¸â£'
		Case 3
			Return '3ï¸â£'
		Case 4
			Return '4ï¸â£'
		Case 5
			Return '5ï¸â£'
		Case 6
			Return '6ï¸â£'
		Case 7
			Return '7ï¸â£'
		case 8
			Return '8ï¸â£'
		Case 9
			Return '9ï¸â£'
		Case '0'
			Return '0ï¸â£'
	EndSwitch

EndFunc

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $form = GUICreate("Tá»± Äá»ng gá»­i emoji", 720, 438, -1, -1)
Global $menu_extension = GUICtrlCreateMenu("Tiá»n Ã­ch")
Global $menu_extension_download_post_man = GUICtrlCreateMenuItem("Táº£i Post Man", $menu_extension)
Global $menu_extension_create_bot_discord= GUICtrlCreateMenuItem("Táº¡o bot discord", $menu_extension)
Global $menu_extension_line = GUICtrlCreateMenuItem("", $menu_extension)
Global $menu_extension_change_token = GUICtrlCreateMenuItem("Äá»i token bot discord", $menu_extension)
Global $menu_document = GUICtrlCreateMenu("HÆ°á»ng dáº«n")
Global $menu_document_get_bot_token = GUICtrlCreateMenuItem("HÆ°á»ng dáº«n láº¥y token bot discord", $menu_document)
Global $menu_document_add_bot_to_sever = GUICtrlCreateMenuItem("HÆ°á»ng dáº«n thÃªm bot vÃ o sever", $menu_document)
Global $menu_about = GUICtrlCreateMenu("About")
Global $menu_about_me = GUICtrlCreateMenuItem("Vá» tÃ´i", $menu_about)
GUISetFont(20, 400, 0, "Segoe UI")
GUISetBkColor(0xC0DCC0)
Global $input_content = GUICtrlCreateInput("", 80, 80, 553, 45)
Global $input_link = GUICtrlCreateInput("", 80, 216, 553, 45)
Global $label_content = GUICtrlCreateLabel("Nháº­p vÃ o ná»i dung", 80, 32, 523, 41)
Global $label_link = GUICtrlCreateLabel("Nháº­p vÃ o ÄÆ°á»ng dáº«n tin nháº¯n", 80, 168, 531, 41)
Global $button_send = GUICtrlCreateButton("Gá»­i emoji", 248, 296, 211, 89, $BS_DEFPUSHBUTTON)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $menu_extension_download_post_man
			ShellExecute("https://www.postman.com/downloads/")

		Case $menu_extension_create_bot_discord
			ShellExecute("https://discord.com/developers/applications/")

		Case $menu_extension_change_token
			$new_token = InputBox("Thay token cá»§a bot discord", "DÃ¡n token vÃ o ÄÃ¢y")
			if @error == 1 Then
				ContinueLoop
			ElseIf @error == 0 Then
				MsgBox(48 + 262144, "Lá»i", "Token khÃ´ng ÄÆ°á»£c Äá» trá»ng")
				ContinueLoop
			EndIf
			$bot_token = $new_token
			MsgBox(48 + 262144, "ThÃ´ng bÃ¡o", "ÄÃ£ Äá»i token bot")
			MsgBox(0,0, $bot_token)

		Case $menu_document_get_bot_token
			MsgBox(0 + 262144, 'HÆ°á»ng dáº«n', 'Láº¥y token cá»§a bot táº¡i https://discord.com/developers/applications/' & @CRLF & 'Äáº§u tiÃªn táº¡o 1 con bot: ' & @CRLF & '1. áº¤n vÃ o nÃºt New Applications á» gÃ³c pháº£i bÃªn trÃªn Äá» táº¡o' & @CRLF & '2. áº¤n vÃ o cÃ¡i vá»«a táº¡o, chá»n má»¥c Bot á» menu bÃªn trÃ¡i' & @CRLF & '3. Copy Token cá»§a bot á» má»¥c Built-A-Bot')

		Case $menu_document_add_bot_to_sever
			MsgBox(0 + 262144, 'HÆ°á»ng dáº«n', 'ThÃªm bot vÃ o sever táº¡i https://discord.com/developers/applications' & @CRLF & '1. Chá»n Application cá»§a báº¡n' & @CRLF & '2. Chá»n OAuth2 á» menu bÃªn trÃ¡i, sau ÄÃ³ chá»n URL' & @CRLF & '3. Tick vÃ o Ã´ bot á» má»¥c SCOPES, sau ÄÃ³ tick vÃ o cÃ¡c quyá»n mÃ  báº¡n muá»n bot báº¡n cÃ³' & @CRLF & '5. Copy link á» phÃ­a bÃªn dÆ°á»i vÃ  má» á» tab má»i')

		Case $menu_about_me
			MsgBox(0 + 262144, 'TÃ¡c giáº£', 'Sáº£n pháº©m ÄÆ°á»£c viáº¿t bá»i Mao Leng' & @CRLF & @CRLF & 'Sá»­ dá»¥ng truy váº¥n HTTP qua WinHTTPRequest vÃ  API Discord' & @CRLF & @CRLF &'LiÃªn há» qua Mao Leng#2843')

		Case $button_send
			$content = GUICtrlRead($input_content)
			$link = GUICtrlRead($input_link)

			$url_channel = StringMid($link, 49,18)
			$url_message = StringRight($link, 18)
			$content_index = StringSplit($content, "")

			for $i = 1 to $content_index[0]
				$each_emoji = _convert_word_to_emoji($content_index[$i])

				$request = "https://discordapp.com/api/v6/channels/" & $url_channel & "/messages/" & $url_message & "/reactions/" & $each_emoji & "/@me"
				$oHTTP.open('PUT', $request, False)
				$oHTTP.SetRequestHeader("user-agent", "PostmanRuntime/7.28.4")
				$oHTTP.SetRequestHeader('Authorization', 'Bot ' & $bot_token)
				$oHTTP.send()
				$oHTTP.WaitForResponse

				$response = $oHTTP.responseText
				ConsoleWrite($response)

				if $response == 'error code: 1020' Then
					MsgBox(16 + 262144, 'Tháº¥t báº¡i', 'ChÆ°a cÃ i Äáº·t Post Man' & @CRLF & 'Táº£i Post Man táº¡i https://www.postman.com/downloads/')
					ExitLoop
				ElseIf $response == '{"message": "401: Unauthorized", "code": 0}' Then
					MsgBox(16 + 262144, 'Tháº¥t báº¡i', 'Sai token cá»§a bot')
					ExitLoop
				ElseIf $response == '{"message": "Missing Access", "code": 50001}' Then
					MsgBox(16 + 262144, 'Tháº¥t báº¡i', 'ChÆ°a thÃªm bot vÃ o sever hoáº·c chÆ°a cho quyá»n cho bot')
					ExitLoop
				ElseIf $response == '{"message": "Unknown Emoji", "code": 10014}' Then
					MsgBox(16 + 262144, 'Tháº¥t báº¡i', 'Emoji khÃ´ng tá»n táº¡i')
					ExitLoop
				ElseIf $response == '{"message": "Unknown Message", "code": 10008}' Then
					MsgBox(16 + 262144, 'Tháº¥t báº¡i', 'Sai Äá»a chá» tin nháº¯n')
					ExitLoop
				ElseIf $response == '{"message": "Unknown Channel", "code": 10003}' Then
					MsgBox(16 + 262144, 'Tháº¥t báº¡i', 'Sai Äá»a chá» kÃªnh chat')
					ExitLoop



				EndIf


			Next

			If $response == '' Then
				MsgBox(16 + 262144, 'HoÃ n thÃ nh', 'ÄÃ£ gá»­i emoji')
			endif


	EndSwitch
WEnd
