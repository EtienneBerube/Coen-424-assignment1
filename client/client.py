
import requests
import random

loop = True

while loop :
    URL = "http://localhost:8888/data/"
    print("Which product:\n1)DVD data\n2)NDBench data\n[ENTER NUMBER] ")
    product = input("Product: ")

    if product == 1:
        product = "DVD"
    elif product == 2:
        product = "NDBench"
    else:
        print("Bad input, start again \n")
        continue

    print("Which data set:\n1)Training\n2)Testing\n[ENTER NUMBER]")
    set = input("Data set: ")

    if set == 1:
        set = "Training"
    elif set == 2:
        set = "Testing"
    else:
        print("Bad input, start again \n")
        continue

    print("Starting batch \n[ENTER NUMBER]")
    batchId = input()

    print("Batch size \n[ENTER NUMBER]")
    batchUnit = input()

    print("Number of batches \n[ENTER NUMBER]")
    batchSize = input()

    print("Which metric :\n1)CPU Utilization\n2)Network in\n3)Network out\n4)Memory utilization\n5)Final Target[ENTER NUMBER]")
    metric = input("Data set: ")

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
    protocol = input("Data set: ")

    if protocol == 1:
        protocol = "json"
    elif protocol == 2:
        protocol = "proto"
    else:
        print("Bad input, start again \n")
        continue


    rfwId = random.randint();


    data = requests.get(url=URL, params=PARAMS)