#include <array.au3>

Global $bot_token = 'OTI4MTk5NjE1MTQ3Mjk4ODE2.YdVTQQ.AWMhWY8mnqG4C19gFeJsZqj0jf8'
Global $oHTTP = ObjCreate('WinHttp.WinHttpRequest.5.1')

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
Global $menu_extension = GUICtrlCreateMenu("Tiện ích")
Global $menu_extension_download_post_man = GUICtrlCreateMenuItem("Tải Post Man", $menu_extension)
Global $menu_extension_create_bot_discord= GUICtrlCreateMenuItem("Tạo bot discord", $menu_extension)
Global $menu_document = GUICtrlCreateMenu("Hướng dẫn")
Global $menu_document_get_bot_token = GUICtrlCreateMenuItem("Hướng dẫn lấy token bot discord", $menu_document)
Global $menu_document_add_bot_to_sever = GUICtrlCreateMenuItem("Hướng dẫn thêm bot vào sever", $menu_document)
Global $menu_about = GUICtrlCreateMenu("About")
Global $menu_about_me = GUICtrlCreateMenuItem("Về tôi", $menu_about)
GUISetFont(20, 400, 0, "Segoe UI")
GUISetBkColor(0xC0DCC0)
Global $input_content = GUICtrlCreateInput("", 80, 80, 553, 45)
Global $input_link = GUICtrlCreateInput("", 80, 216, 553, 45)
Global $label_content = GUICtrlCreateLabel("Nhập vào nội dung", 80, 32, 523, 41)
Global $label_link = GUICtrlCreateLabel("Nhập vào đường dẫn tin nhắn", 80, 168, 531, 41)
Global $button_send = GUICtrlCreateButton("Gửi emoji", 248, 296, 211, 89, $BS_DEFPUSHBUTTON)
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

		Case $menu_document_get_bot_token
			MsgBox(0, 'Hướng dẫn', 'Lấy token của bot tại https://discord.com/developers/applications/' & @CRLF & 'Đầu tiên tạo 1 con bot: ' & @CRLF & '1. Ấn vào nút New Applications ở góc phải bên trên để tạo' & @CRLF & '2. Ấn vào cái vừa tạo, chọn mục Bot ở menu bên trái' & @CRLF & '3. Copy Token của bot ở mục Built-A-Bot')

		Case $menu_document_add_bot_to_sever
			MsgBox(0, 'Hướng dẫn', 'Thêm bot vào sever tại https://discord.com/developers/applications' & @CRLF & '1. Chọn Application của bạn' & @CRLF & '2. Chọn OAuth2 ở menu bên trái, sau đó chọn URL' & @CRLF & '3. Tick vào ô bot ở mục SCOPES, sau đó tick vào các quyền mà bạn muốn bot bạn có' & @CRLF & '5. Copy link ở phía bên dưới và mở ở tab mới')

		Case $menu_about_me
			MsgBox(0, 'Tác giả', 'Sản phẩm được viết bởi Mao Leng' & @CRLF & @CRLF & 'Sử dụng truy vấn HTTP qua WinHTTPRequest và API Discord' & @CRLF & @CRLF &'Liên hệ qua Mao Leng#2843')

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
					MsgBox(16 + 262144, 'Thất bại', 'Chưa cài đặt Post Man' & @CRLF & 'Tải Post Man tại https://www.postman.com/downloads/')
					ExitLoop
				ElseIf $response == '{"message": "401: Unauthorized", "code": 0}' Then
					MsgBox(16 + 262144, 'Thất bại', 'Sai token của bot' & @CRLF & 'Lấy token của bot tại https://discord.com/developers/applications/' & @CRLF & 'Các bước tạo 1 con bot: ' & @CRLF & '1. Ấn vào nút New Applications ở góc phải bên trên để tạo' & @CRLF & '2. Ấn vào cái vừa tạo, chọn mục Bot ở menu bên trái' & @CRLF & '3. Copy Token của bot ở mục Built-A-Bot')
					ExitLoop
				ElseIf $response == '{"message": "Missing Access", "code": 50001}' Then
					MsgBox(16 + 262144, 'Thất bại', 'Chưa thêm bot vào sever hoặc chưa cho quyền cho bot')
					ExitLoop
				ElseIf $response == '{"message": "Unknown Emoji", "code": 10014}' Then
					MsgBox(16 + 262144, 'Thất bại', 'Emoji không tồn tại')
					ExitLoop
				ElseIf $response == '{"message": "Unknown Message", "code": 10008}' Then
					MsgBox(16 + 262144, 'Thất bại', 'Sai địa chỉ tin nhắn')
					ExitLoop
				ElseIf $response == '{"message": "Unknown Channel", "code": 10003}' Then
					MsgBox(16 + 262144, 'Thất bại', 'Sai địa chỉ kênh chat')
					ExitLoop



				EndIf


			Next

			If $response == '' Then
				MsgBox(16 + 262144, 'Hoàn thành', 'Đã gửi emoji')
			endif


	EndSwitch
WEnd
