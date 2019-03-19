import sys


def main(file):
    #print("----Starting endpointsParser----")

    with open(file) as fp:
        line = fp.readline()
        endpoints = []
        while line:
            #print(line)
            if "endpoints:" in line:
                line = fp.readline()
                if "functions:" not in line:
                    endpoint = line.split(" - ")[-1].strip()
                    #print("endpoint found: {}".format(endpoint))
                    endpoints.append(endpoint)
                else:
                    break
            line = fp.readline()
    return endpoints

#print(main("deploy.out"))

if __name__ == '__main__':
    file = sys.argv[1]
    endpoints = main(file)
    endpoints = str(tuple(endpoints)).replace(",", "")
    print(endpoints)



