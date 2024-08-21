# PowerShell-Skript, das Netcat (nc) simuliert

$serverIP = "127.0.0.1"
$port = 8080

$client = New-Object System.Net.Sockets.TcpClient($serverIP, $port)

$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream)
$reader = New-Object System.IO.StreamReader($stream)

$message = "2800014"
$writer.WriteLine($message)
$writer.Flush()

while (($line = $reader.ReadLine()) -ne $null) {
    Write-Host $line
}

$writer.Close()
$reader.Close()
$client.Close()

