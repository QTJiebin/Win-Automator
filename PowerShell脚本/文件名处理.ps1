Get-ChildItem -Recurse -Force -Filter "* *" | Rename-Item -NewName { $_.Name -replace " ","" }
Get-ChildItem -Recurse -Force -Filter "*�C*" | Rename-Item -NewName { $_.Name -replace "�C","-" }
Get-ChildItem -Recurse -Force -Filter "*��*" | Rename-Item -NewName { $_.Name -replace "��","-" }

# �b cmd ���ϥ�

powershell -command "Get-ChildItem -Recurse -Force -Filter '* *' | Rename-Item -NewName { $_.Name -replace ' ','' }"
powershell -command "Get-ChildItem -Recurse -Force -Filter '*�C*' | Rename-Item -NewName { $_.Name -replace '�C','-' }"
powershell -command "Get-ChildItem -Recurse -Force -Filter '*��*' | Rename-Item -NewName { $_.Name -replace '��','-' }"