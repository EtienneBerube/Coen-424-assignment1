import json
import uuid
import sys
import requests
import time

import data_packet_pb2
URL = "https://coen424models.azurewebsites.net/"
loop = True

print('Please note that this assignment is hosted on Azure. As this program is on the free tier, \n'
      'the VM is closed every time the app goes idle. Therefore, the first request can take up to '
      '5 minutes to initialize. Please be patient. It works, I promise')

print('Initializing...')
while(True):
    init_server = requests.get(url=URL, timeout=(6*60, 6*60))
    init_server.encoding = 'utf-8'
    if(init_server.text == '"working"'):
        print('Done...')
        break
    else:
        print('Could not reach server, trying again')
        time.sleep(30)



while loop:

    print("Which product:\n1)DVD data\n2)NDBench data\n[ENTER NUMBER] ")
    product = int(input())

    if product == 1:
        product = "dvd"
    elif product == 2:
        product = "ndbench"
    else:
        print("Bad input, start again \n")
        continue

    print("\nWhich data set:\n1)Training\n2)Testing\n[ENTER NUMBER]")
    set = int(input())

    if set == 1:
        set = "training"
    elif set == 2:
        set = "testing"
    else:
        print("Bad input, start again \n")
        continue

    print("\nStarting batch \n[ENTER NUMBER]")
    batchId = int(input())

    print("\nBatch size \n[ENTER NUMBER]")
    batchUnit = int(input())

    print("\nNumber of batches \n[ENTER NUMBER]")
    batchSize = int(input())

    print(
        "\nWhich metric :\n1)CPU Utilization\n2)Network in\n3)Network out\n4)Memory utilization\n5)Final Target\n[ENTER NUMBER]")
    metric = int(input())

    if metric == 1:
        metric = "CPUUtilization_Average"
    elif metric == 2:
        metric = "NetworkIn_Average"
    elif metric == 3:
        metric = "NetworkOut_Average"
    elif metric == 4:
        metric = "MemoryUtilization_Average"
    elif metric == 5:
        metric = "Final_Target"
    else:
        print("Bad input, start again \n")
        continue

    print("\nWhich Communication protocol :\n1)JSON\n2)Protobuf\n[ENTER NUMBER]")
    protocol = int(input())

    if protocol == 1:
        protocol = "json"
    elif protocol == 2:
        protocol = "proto"
    else:
        print("Bad input, start again \n")
        continue

    rfwId = uuid.uuid4().hex

    params = {
        "rfwId": rfwId,
        "metric": metric,
        "batchUnit": batchUnit,
        "batchId": batchId,
        "batchSize": batchSize
    }

    url = URL + 'data/' + product + '-' + set + '/' + protocol

    print('\nSending to: ' + url + '\nWith id: ' + rfwId)

    data = requests.get(url=url, params=params)

    print("========RESULTS========")
    print('Response size: ' + str(sys.getsizeof(data.content)))

    if (protocol == 'json'):

        print(json.dumps(data.json(), sort_keys=True, indent=4))

    elif protocol == 'proto':
        parsed_data = data_packet_pb2.ReturnPacket()
        print('\nBefore serialization: '+ data.text)
        parsed_data.ParseFromString(data.content)

        print('\nid: '+ parsed_data.rfwId)

        print('last batch: '+ str(parsed_data.lastBatchId))

        print('results: ['+ ''.join('\n' + str(e) for e in parsed_data.results))
        print(']')
    else:
        print('Cannot read response')

    redo = input('Start again? [y/n]: ')

    if redo == 'y':
        loop = True
        print("=============== Next Batch ==============")
    elif redo == 'n':
        loop = False
    else:
        print('Unrecognized option, exiting')
        break
