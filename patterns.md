(s?ftp|http)s?:\/\/(www\.)?(?!((.*\.)?(aka.ms|googleapis\.com|gvt1\.com|hp\.com|microsoft\.com|sentinelone\.net|symantecliveupdate\.com|windowsupdate\.com)/?))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,32}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)


'\b\w+tps?://[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/))'


grep -Eo '\b[a-zA-Z]+tps?://[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/))' file.txt
