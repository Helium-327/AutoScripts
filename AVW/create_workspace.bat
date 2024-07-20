@echo off
setlocal enabledelayedexpansion

chcp 65001

:: 使用第一个命令行参数作为工作区的简称
set /p namespace="input workspace name: "

:: 显示用户输入的值以确认
echo 您输入的工作区简称为: %namespace%

:: 暂停脚本，等待用户按键继续
pause

:: 在G盘创建对应的文件夹"WS-<namespace>"
set "folderPath=G:\\WS-Hub\\WS-%namespace%"
mkdir "%folderPath%"

:: 创建"<namespace>.code-workspace"文件并写入指定格式的内容
set "workspaceFile=%namespace%.code-workspace"
(
    echo {
    echo 	"folders": [
    echo 		{
    echo 			"path": "%folderPath%"
    echo 		}
    echo 	],
    echo 	"settings": {}
    echo }
) > "%folderPath%\%workspaceFile%"

:: 将文件移动到"G:\OneDrive\vscodeWorkspaceProfile"路径下
set "onedrivePath=G:\\OneDrive\\vscodeWorkspaceProfile"
move "%folderPath%\%workspaceFile%" "%onedrivePath%"

echo "工作区配置文件已创建并移动到指定路径。"
echo "工作区路径: %onedrivePath%\\%workspaceFile%"

endlocal
