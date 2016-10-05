import re

import paramiko


def split_before_names(filtered_text):
    previous = 0
    for m in re.finditer('{"names":', filtered_text):
        yield filtered_text[previous:m.start()]
        previous = m.start()
    yield filtered_text[previous:]


def filter_tcpdump(unfiltered_response):
    content = ''
    filtered_list = []

    for line in unfiltered_response:
        content += line.strip()

    unfiltered_list = list(split_before_names(content))

    for line in unfiltered_list:
        if line.startswith('{"names":'):
            if ']}}' in line:
                while True:
                    if line[-3:] != ']}}':
                        line = line[:-1]
                        # print line
                    elif line[-3:] == ']}}':
                        filtered_list.append(line)
                        break
                    else:
                        break
            else:
                filtered_list.append(line)

    return filtered_list


def fetch_tcpdump(server, username, key_path):
    command = "sudo tcpdump -v -A -n -i eth0 -s 0 -c 1 src or dst port 9092"

    client = paramiko.client.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.load_system_host_keys(key_path)

    client.connect(server, port=22, username=username, key_filename=key_path)

    ssh_stdin, ssh_stdout, ssh_stderr = client.exec_command(command)
    response = ssh_stdout.readlines()
    if client:
        client.close()

    return response
