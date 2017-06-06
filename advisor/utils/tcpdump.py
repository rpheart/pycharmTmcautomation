import re
import time

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
                    elif line[-3:] == ']}}':
                        filtered_list.append(line)
                        break
                    else:
                        break
            else:
                filtered_list.append(line)

    return filtered_list


def fetch_tcpdump(server, username, key_path, timeout=90):
    # commands
    file_path = "/tmp/tcpdump.log"
    execute_tcpdump = "sudo timeout %d tcpdump -A -n -i eth0 -s 0 src or dst port 9092 -w %s" % (timeout, file_path)

    # ssh setup
    client = paramiko.client.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.load_system_host_keys(key_path)
    client.connect(server, port=22, username=username, key_filename=key_path)

    ssh_transp = client.get_transport()
    chan = ssh_transp.open_session()
    chan.setblocking(0)
    chan.exec_command(execute_tcpdump)
    time.sleep(timeout)

    # fetch and return tcpdump output
    sftp = client.open_sftp()
    remote_file = sftp.file(file_path, 'r')
    file_content = remote_file.read()
    ssh_transp.close()
    if client:
        client.close()

    return file_content
