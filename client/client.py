
import requests
import random
import uuid
from data_packet_pb2 import ReturnPacket

loop = True

while loop :
    URL = "http://localhost:80/data/"
    print("Which product:\n1)DVD data\n2)NDBench data\n[ENTER NUMBER] ")
    product = int(input("Product: "))

    if product == 1:
        product = "dvd"
    elif product == 2:
        product = "ndbench"
    else:
        print("Bad input, start again \n")
        continue

    print("Which data set:\n1)Training\n2)Testing\n[ENTER NUMBER]")
    set = int(input("Data set: "))

    if set == 1:
        set = "training"
    elif set == 2:
        set = "testing"
    else:
        print("Bad input, start again \n")
        continue

    print("Starting batch \n[ENTER NUMBER]")
    batchId = int(input())

    print("Batch size \n[ENTER NUMBER]")
    batchUnit = int(input())

    print("Number of batches \n[ENTER NUMBER]")
    batchSize = int(input())

    print("Which metric :\n1)CPU Utilization\n2)Network in\n3)Network out\n4)Memory utilization\n5)Final Target[ENTER NUMBER]")
    metric = int(input("Data set: "))

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

    print("Which Communication protocol :\n1)JSON\n2)Protobuf\n[ENTER NUMBER]")
    protocol = int(input("Protocol: "))

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

    url = URL+product+'-'+set+'/'+protocol

    print(url)

    print(params)




    data = requests.get(url=url, params=params)

    if(protocol == 'json'):
        print(data.json)
    elif protocol == 'proto':
        parsed_data = ReturnPacket()
        print(parsed_data.ParseFromString(data.text))
    else:
        print('Cannot read response')

