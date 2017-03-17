# Konfiguracja tuneli SSH na macos i linux LAB TINE


Jeżeli nie mamy pliku config:

`mkdir ~/.ssh`

`touch ~/.ssh/config`

`chmod 777 ~/.ssh/config`

Pobieramy skrypt: 

`sudo wget -O /bin/`

Dodajemy uprawnienia wynonywania:

`sudo chmod +x /bin/tine_lab.sh`

W ulubionym edytorze plików edytujemy pole username np.:
`sudo nano /bin/tine_lab.sh`

np. `username="imie.nazwisko"`

zapisujemy 

CIESZYMY się łatwym korzystaniem:

`tine_lab.sh 10.0.0.x`

`ssh tine`
