from clint.textui import progress, puts
from clint import arguments
import blindspin
import browsercookie
import requests

args = arguments.Args()

if args.get(0) == 'firefox':
    puts('Grabbing cookies from Firefox')
    jar = browsercookie.firefox()
elif args.get(0) == 'chrome':
    puts('Grabbing cookies from Chrome')
    jar = browsercookie.chrome()
else:
    puts('Grabbing cookies from Firefox')
    jar = browsercookie.firefox()

url = 'https://www.safaribooksonline.com/a/export/csv/'

puts('\nWaiting for download to begin... (may take a while)')

with blindspin.spinner():
    r = requests.get(url, stream=True, cookies=jar)

total_size = int(r.headers.get('content-length', 0))

filename = 'safari.csv'

with open(filename, 'wb') as out_file:

    for chunk in progress.bar(r.iter_content(chunk_size=1024), expected_size=(total_size/1024) + 1): 
        if chunk:
            out_file.write(chunk)
            out_file.flush()

puts('File saved to {filename}\n'.format(filename=filename))
