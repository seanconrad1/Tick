let fs = require('fs');

function getNewToken() {
	let data = fs.readFileSync('mitmlog.txt', 'utf8')
	let re = /X-Auth-Token,36:(.{8}\-.{4}\-.{4}\-.{4}\-.{12})/;
	if (re.test(data)) {
		let matches = re.exec(data);
		updateTokenFile(matches[1])
	}
}

function updateTokenFile(newToken) {
	var fs = require('fs')
		var result = `ENV['token'] = "${newToken}"`
		fs.writeFile('env.rb', result, 'utf8', function (err) {
			if (err) return console.log(err);
	})
}

getNewToken()