Get-ChildItem -Recurse -Force -Filter "* *" | Rename-Item -NewName { $_.Name -replace " ","" }
Get-ChildItem -Recurse -Force -Filter "*�C*" | Rename-Item -NewName { $_.Name -replace "�C","-" }
Get-ChildItem -Recurse -Force -Filter "*��*" | Rename-Item -NewName { $_.Name -replace "��","-" }

# �趨Ŀ¼��ȣ���ƥ���ļ�

Get-ChildItem -Recurse -Force -Filter "* *" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace " ","" }
Get-ChildItem -Recurse -Force -Filter "*�C*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "�C","_" }
Get-ChildItem -Recurse -Force -Filter "*-*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "-","_" }
Get-ChildItem -Recurse -Force -Filter "*��*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "��","_" }
Get-ChildItem -Recurse -Force -Filter "*��*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "��","(" }
Get-ChildItem -Recurse -Force -Filter "*��*" -Depth 0 -File -Include "*" | Rename-Item -NewName { $_.Name -replace "��",")" }

# cmd ��ʹ��

powershell -command "Get-ChildItem -Recurse -Force -Filter '* *' | Rename-Item -NewName { $_.Name -replace ' ','' }"
powershell -command "Get-ChildItem -Recurse -Force -Filter '*�C*' | Rename-Item -NewName { $_.Name -replace '�C','-' }"
powershell -command "Get-ChildItem -Recurse -Force -Filter '*��*' | Rename-Item -NewName { $_.Name -replace '��','-' }"