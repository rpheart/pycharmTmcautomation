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
                        # print line
                    elif line[-3:] == ']}}':
                        filtered_list.append(line)
                        break
                    else:
                        break
            else:
                filtered_list.append(line)

    return filtered_list


def fetch_tcpdump(server, username, key_path, total_packets=3):
    command = "sudo tcpdump -v -A -n -c %s -i eth0 -s 0 -c 2 src or dst port 9092" % total_packets

    client = paramiko.client.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.load_system_host_keys(key_path)

    client.connect(server, port=22, username=username, key_filename=key_path)

    sleeptime = 0.001
    outdata, errdata = '', ''
    ssh_transp = client.get_transport()
    chan = ssh_transp.open_session()
    chan.setblocking(0)
    chan.exec_command(command)

    while True:  # monitoring process
        # Reading from output streams
        while chan.recv_ready():
            outdata += chan.recv(1000)
        while chan.recv_stderr_ready():
            errdata += chan.recv_stderr(1000)
        if chan.exit_status_ready():  # If completed
            break
        time.sleep(sleeptime)

    exit_code = chan.recv_exit_status()
    ssh_transp.close()

    print "Command exit code:", exit_code
    print "Error:", errdata
    print "Data:", outdata

    if client:
        client.close()

    return outdata
