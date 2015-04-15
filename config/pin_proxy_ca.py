#!/usr/bin/env python
# encoding: utf-8
import json
import requests
import fileinput
import sys

def pretty_print_json(js):
    print json.dumps(js, indent=4, separators=(',', ': '))

def build_ca_proxied_json(js):
    "Return json with master pinning and ca_proxy enabled"
    id = js["id"]
    js["classes"]["puppet_enterprise::profile::master"] = { "enable_ca_proxy": True }
    js["rule"] = [
        "or",
        [
            "and",
            [
                "~",
                [
                    "fact","hostname"
                ],
                "master"
            ]
        ]
    ]
    res = {
        "classes": js["classes"],
        "rule": js["rule"]
    }
    return (id, res)

def process_json(string):
    "Convert raw string into json object"
    return json.loads(string)

def get_infrastructure_class(js):
    for node in js:
        if "PE Master" in node[u"name"]:
            return node

def update_puppet_console(id, js):
    "Updates PE ENC to enable_ca_proxy"


def main():
    "Entry point"
    master = ""
    js = ""
    if "https://" in sys.argv[1]:
        master = sys.argv[1] + "/classifier-api/v1"
        js = requests.get(master + "/groups",
                          cert=('/etc/puppetlabs/puppet/ssl/certs/master-top.puppetdemo.local.pem', '/etc/puppetlabs/puppet/ssl/private_keys/master-top.puppetdemo.local.pem'),
                          verify=False).text
        js = process_json(js)
    else:
        for line in fileinput.input():
            js = process_json(line)

    js = get_infrastructure_class(js)
    id, js = build_ca_proxied_json(js)
    headers = { "content-type": "application/json" }
    res = requests.post(master + "/groups/" + id,
                        headers=headers,
                        data=json.dumps(js),
                        cert=('/etc/puppetlabs/puppet/ssl/certs/master-top.puppetdemo.local.pem', '/etc/puppetlabs/puppet/ssl/private_keys/master-top.puppetdemo.local.pem'),
                        verify=False)
    if res.status_code != 200:
        print "Something went wrong"
    else:
        print "Updated PE masters with ca_proxy feature"

if __name__ == '__main__':
    main()
