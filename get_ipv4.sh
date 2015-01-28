#!/bin/sh
curl -s http://checkip.dyndns.org | sed s/'<html><head><title>Current IP Check<\/title><\/head><body>Current IP Address: '// | sed s/'<\/body><\/html>'//

