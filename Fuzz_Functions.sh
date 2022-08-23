filefuzz(){
  echo -e "\nCOMMON SEARCH\n"
  ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/common.txt

  echo -e "\nDIRSEARCH FUZZING\n"
  dirsearch -u $1 -t 40

  echo -e "\nRAFT LARGE FILES\n"
  ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-large-files.txt

  read REPLY\?"SELECT BACKEND FOR BIASED FUZZING: (php, iis, jsp)"
  if [[ $REPLY =~ ^[php]$ ]]
  then
    echo -e "\nCGI / PHP FILES\n"
    ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/cgi_php.txt
  exit

  elif [[ $REPLY =~ ^[iis]$ ]]
  then
    echo -e "\nCOMMON IIS\n"
    ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/iisfinal.txt
    
    echo -e "\nIIS FILES\n"
    ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/httparchive_IIS.txt
    exit

  elif [[ $REPLY =~ ^[jsp]$ ]]
  then
    echo -e "\nDO / JSP FILES\n"
    ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/httparchive_jsp.txt
    exit
  fi
}

apifuzz(){
  echo -e "\nAPI SEARCHING\n"
  ffuf -v -fc 404,402,405,207,502,500 -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/apilist.txt
}

dirfuzz(){
  echo -e "\nCOMMON FUZZING\n"
  ffuf -v -fc 404,402,405,207,502,500 -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/common.txt

  echo -e "\nROBOTS DISALLOWED\n"
  ffuf -v -fc 404,402,405,207,502,500 -r -c -u $1FUZZ -w /usr/share/seclists/Discovery/Web-Content/RobotsDisallowed-Top1000.txt

  echo -e "\nRAFT LARGE DIRECTORIES\n"
  ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ/ -w /usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt

  echo -e "\n2.3-MEDIUM DIRECTORIES\n"
  ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ/ -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt

  echo -e "\nHTTPARCHIVE DIRECTORIES\n"
  ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ/ -w /usr/share/seclists/Discovery/Web-Content/httparchive_dirs.txt

  echo -e "\nONE FOR ALL SHORT DIRECTORIES\n"
  ffuf -v -fc 404,402,405,207,502,500  -r -c -u $1FUZZ/ -w /usr/share/seclists/Discovery/Web-Content/onelistforallshort.txt
}
