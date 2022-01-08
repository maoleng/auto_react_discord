#include <array.au3>

Global $bot_token = 'OTI4MTk5NjE1MTQ3Mjk4ODE2.YdVTQQ.cA_dK4ngzQKyLCfm5qPytz-G9N0'
Global $oHTTP = ObjCreate('WinHttp.WinHttpRequest.5.1')

Func _send_request_http($url_channel, $url_message, $each_emoji, $bot_token, $oHTTP)
	$request = "https://discordapp.com/api/v6/channels/" & $url_channel & "/messages/" & $url_message & "/reactions/" & $each_emoji & "/@me"
	$oHTTP.open('PUT', $request, False)
	$oHTTP.SetRequestHeader("user-agent", "PostmanRuntime/7.28.4")
	$oHTTP.SetRequestHeader('Authorization', 'Bot ' & $bot_token)
	$oHTTP.send()
	$oHTTP.WaitForResponse
EndFunc

Func _convert_word_to_emoji($content_index)
	Switch($content_index)
		Case 'a'
			Return '🇦'
		Case 'b'
			Return '🇧'
		Case 'c'
			Return '🇨'
		Case 'd'
			Return '🇩'
		Case 'e'
			Return '🇪'
		Case 'f'
			Return '🇫'
		Case 'g'
			Return '🇬'
		Case 'h'
			Return '🇭'
		Case 'i'
			Return '🇮'
		Case 'j'
			Return '🇯'
		Case 'k'
			Return '🇰'
		Case 'l'
			Return '🇱'
		Case 'm'
			Return '🇲'
		Case 'n'
			Return '🇳'
		Case 'o'
			Return '🇴'
		Case 'p'
			Return '🇵'
		Case 'q'
			Return '🇶'
		Case 'r'
			Return '🇷'
		Case 's'
			Return '🇸'
		Case 't'
			Return '🇹'
		Case 'u'
			Return '🇺'
		Case 'v'
			Return '🇻'
		Case 'w'
			Return '🇼'
		Case 'x'
			Return '🇽'
		Case 'y'
			Return '🇾'
		Case 'z'
			Return '🇿'
		Case 1
			Return '1️⃣'
		Case 2
			Return '2️⃣'
		Case 3
			Return '3️⃣'
		Case 4
			Return '4️⃣'
		Case 5
			Return '5️⃣'
		Case 6
			Return '6️⃣'
		Case 7
			Return '7️⃣'
		case 8
			Return '8️⃣'
		Case 9
			Return '9️⃣'
		Case '0'
			Return '0️⃣'
	EndSwitch

EndFunc

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $form = GUICreate("Tự động gửi emoji", 720, 438, -1, -1)
GUISetFont(20, 400, 0, "Segoe UI")
GUISetBkColor(0xC0DCC0)
Global $input_content = GUICtrlCreateInput("", 80, 80, 553, 45)
Global $input_link = GUICtrlCreateInput("", 80, 216, 553, 45)
Global $label_content = GUICtrlCreateLabel("Nhập vào nội dung", 80, 32, 523, 41)
Global $label_link = GUICtrlCreateLabel("Nhập vào đường dẫn tin nhắn", 80, 168, 531, 41)
Global $button_send = GUICtrlCreateButton("Gửi emoji", 248, 296, 211, 89)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $button_send
			$content = GUICtrlRead($input_content)
			$link = GUICtrlRead($input_link)

			$url_channel = StringMid($link, 49,18)
			$url_message = StringRight($link, 18)
			$content_index = StringSplit($content, "")

			for $i = 1 to $content_index[0]
				$each_emoji = _convert_word_to_emoji($content_index[$i])
				_send_request_http($url_channel, $url_message, $each_emoji, $bot_token, $oHTTP)
			Next

			MsgBox(16 + 262144, 'Hoàn thành', 'Đã gửi emoji')

	EndSwitch
WEnd

