Set-ExecutionPolicy bypass
$MyConsole = 'C:\Windows\SysWOW64\cmd.exe'
$computername = 'localhost'

write-host " "
write-host " _____   _____    _____   _____        ___     _____   _____   _____   _____   _____   _____        ___  ___       ___   __   _  "
write-host "|_   _| /  _  \  |  _  \ | ____|      /   |   |  _  \ | ____| |_   _| |_   _| | ____| |  _  \      /   |/   |     /   | |  \ | | " 
write-host "  | |   | | | |  | |_| | | |__       / /| |   | |_| | | |__     | |     | |   | |__   | |_| |     / /|   /| |    / /| | |   \| | "
write-host "  | |   | | | |  |  _  { |  __|     / / | |   |  _  { |  __|    | |     | |   |  __|  |  _  /    / / |__/ | |   / / | | | |\   | "
write-host "  | |   | |_| |  | |_| | | |___    / /  | |   | |_| | | |___    | |     | |   | |___  | | \ \   / /       | |  / /  | | | | \  | "
write-host "  |_|   \_____/  |_____/ |_____|  /_/   |_|   |_____/ |_____|   |_|     |_|   |_____| |_|  \_\ /_/        |_| /_/   |_| |_|  \_| "
write-host " "
write-host " "
write-host  "����1 ɨ�迪�Ŷ˿�"
write-host  "����2 ����/ɾ������ǽ����"
write-host  "����3 �����û��˺�����"
write-host  "����4 ����Ա�˺Ž�Ȩ"
write-host  "����5 �ƶ�/ɾ��/�����ļ�Ŀ¼"
write-host  "����6 �˳�"
write-host " "
while(1){
	[int]$number = read-host "enter a num"
	Switch($number)
	{
		1{
			[string]$ip = read-host "RHOST"
            write-warning "������һ���˿�"
            $S_port = read-host "RPORT (Ĭ��Ϊ1-1024)"
            if($S_port){
                    $S_port | % {echo ((new-object Net.Sockets.TcpClient).Connect($ip,$_)) "Port $_ is open!"} 2>$null
                }
            else{
                1..5960 | % {echo ((new-object Net.Sockets.TcpClient).Connect($ip,$_)) "Port $_ is open!"} 2>$null
                continue;
            }
        }
        
		2{
			Write-Host "����a ���ӷ���ǽ����"
			Write-Host "����b ɾ������ǽ����"
			Write-Host "����c ����3389�˿�"

			[string]$firewall = Read-Host "��ѡ��"
			Switch($firewall){
			a{
			#�ı����ǽ����
				[string] $firewall_policy = read-host "Do  you want to change firewallpolicy?[Y/N]"
				if($firewall_policy -eq "y")
				{ 
					netsh advfirewall set allprofiles state on 1>$nulls
					Write-Host "����ǽ�ѿ�����" -ForegroundColor Red
					netsh advfirewall firewall add rule name="Allow Ping" dir=in protocol=icmpv4 action=block 1>$null
					netsh advfirewall firewall add rule name="FTP20" protocol=TCP dir=in localport=20 action=block 1>$null
					netsh advfirewall firewall add rule name="FTP21" protocol=TCP dir=in localport=21 action=block 1>$null
					netsh advfirewall firewall add rule name="SSH" protocol=TCP dir=in localport=22 action=block 1>$null
					netsh advfirewall firewall add rule name="Telnet" protocol=TCP dir=in localport=23 action=block 1>$null
					netsh advfirewall firewall add rule name="SMTP" protocol=TCP dir=in localport=25 action=block 1>$null
					netsh advfirewall firewall add rule name="TFTP" protocol=UDP dir=in localport=69 action=block 1>$null
					netsh advfirewall firewall add rule name="POP3" protocol=TCP dir=in localport=110 action=block 1>$null
					netsh advfirewall firewall add rule name="Netbios-ns" protocol=UDP dir=in localport=137 action=block 1>$null
					netsh advfirewall firewall add rule name="Netbios-dgm" protocol=UDP dir=in localport=138 action=block 1>$null
					netsh advfirewall firewall add rule name="Netbios-ssn" protocol=TCP dir=in localport=139 action=block 1>$null
					netsh advfirewall firewall add rule name="Netbios-ds" protocol=TCP dir=in localport=445 action=block 1>$null

					Write-Host "Ping have protection" -ForegroundColor Red
					Write-Host "FTP-20 have protection" -ForegroundColor Red
					Write-Host "FTP-21 have protection" -ForegroundColor Red
					Write-Host "SSH have protection" -ForegroundColor Red
					Write-Host "Telnet have protection" -ForegroundColor Red
					Write-Host "SMTP have protection" -ForegroundColor Red
					Write-Host "TFTP have protection" -ForegroundColor Red
					Write-Host "POP3 have protection" -ForegroundColor Red
					Write-Host "Netbios-ns have protection" -ForegroundColor Red
					Write-Host "Netbios-ssn have protection" -ForegroundColor Red
					Write-Host "Netbios-ds have protection" -ForegroundColor Red
					Write-Host "Netbios-dgm have protection" -ForegroundColor Red
				}
				else{"ʳʺ���㣡���治����! -_-|| "}
			}

			b{
                write-warning "��ע�� �ù���������ɾ�����ű�����ӵĲ���"
                $delete = read-host "�Ƿ�ɾ��[Y/N]"
                if($delete -eq "y"){
				    netsh advfirewall firewall delete rule name=Allow Ping dir=in 1>$null
				    netsh advfirewall firewall delete rule name=FTP20 dir=in 1>$null
				    netsh advfirewall firewall delete rule name=FTP21 dir=in 1>$null
				    netsh advfirewall firewall delete rule name=SSH dir=in 1>$null
				    netsh advfirewall firewall delete rule name=Telnet dir=in 1>$null
				    netsh advfirewall firewall delete rule name=SMTP dir=in 1>$null
				    netsh advfirewall firewall delete rule name=TFTP dir=in 1>$null
				    netsh advfirewall firewall delete rule name=POP3 dir=in 1>$null
				    netsh advfirewall firewall delete rule name=Netbios-ns dir=in 1>$null
				    netsh advfirewall firewall delete rule name=Netbios-ssn dir=in 1>$null
				    netsh advfirewall firewall delete rule name=Netbios-ds dir=in 1>$null
				    netsh advfirewall firewall delete rule name=Netbios-dgm dir=in 1>$null
				    Write-Host "���Գɹ�ɾ��"
                }
                else{write-host "δɾ������" -fore yellow
                }
			}

			c{
				[string]$change_port = Read-Host "Do you want change 3889?[Y/N]"
				if($change_port -eq "y")
				{
					if($result.PrimaryStatus -eq '3389'){
						$portNumber = read-host "����������˿ں�(1024-65530)"
						$original=Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'portnumber'
						Write-Host ��ǰRDPĬ�϶˿�Ϊ$original.PortNumber
						$result=Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'portnumber' -Value $PortNumber
						Write-Host �Ѿ���� RDP �˿ڵ��޸ģ� -ForegroundColor Green
						Write-Host �������� Remote Desktop Services ... -ForegroundColor DarkYellow
						Restart-Service termservice -Force
					}
				}
				else{
					write-host "Bye"
			        continue;
				}
			}

			}
		}
    
		3{
			$user = net user
			echo $user
			$C_user = Read-Host "������������ĵ��û���"
			$C_passwd = Read-Host "����������"
			net user $C_user $C_passwd 1>$null
			write-host "���ĳɹ�" -ForegroundColor Yellow
			continue;
		}
		4{
			$Ad_user = net localgroup administrators
			Write-Host ���Ĺ���Ա�˻���
			$group = [ADSI]"WinNT://$env:COMPUTERNAME/administrators"
			$group.psbase.invoke("Members")|%{$_.GetType().InvokeMember("Name",'GetProperty',$null,$_,$null)}
			$policy = Read-Host "������Ҫ��Ȩ���û���"
			net localgroup administrators $policy /del
			write-host "��Ȩ�ɹ�" -ForegroundColor Yellow
			continue;

		}
		5{
			Write-Host "����a �����ļ�Ŀ¼"
			Write-Host "����b �����ļ�"

			[string]$CH_file = Read-Host "��ѡ��"
			Switch($CH_file){
				a{
					$C_file = read-host "����ĵ�ԭ�ļ�Ŀ¼"
					$file = read-host "����ĵ�Ŀ���ļ�Ŀ¼"
					Move-Item -path $C_file\*  -destination $file
					[string]$choose = Read-Host "�ƶ��ɹ� �Ƿ�ɾ��Դ�ļ���[Y/N]"
					if($choose -eq 'y'){
						del $C_file -Recurse
						Write-Host "ɾ���ɹ�"
					}
					else{Write-Host "δɾ��"}
						continue;
				}
				b{
					$dizhi = Read-Host "��������ҵ�ַ"
					$filename = Read-Host "�������ļ���"
					Dir $dizhi -filter *$filename* -recurse 2>$null 
				}
			}	
        
		}

		6{Write-Host "Bye"
			exit;
		}
	}
}

