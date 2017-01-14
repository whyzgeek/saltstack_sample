'''
General grains for system

@Author: Kiarash Bodouhi
'''
import socket

def get_redhat_release():
    result = dict()
    try:
        with open('/etc/redhat-release') as file:
            result['redhat-release'] = ''.join(file.readlines()).strip()
    except:
        result['redhat-release'] = None
    return result

def get_host_ip():
    result = dict()
    try:
        result['host_ip'] = socket.gethostbyname(socket.gethostname())
    except:
        result['host_ip'] = None
    return result

if __name__ == "__main__":
        print get_redhat_release()
