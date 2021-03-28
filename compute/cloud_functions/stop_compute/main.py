from googleapiclient import discovery

def stop_server_pubsub(event, context):

    service = discovery.build('compute', 'v1')
    print('VM Instance stopping')

    # Project ID for this request.
    project = 'minecraft-xxxxxx' 

    # The name of the zone for this request.
    zone = 'australia-southeast1-a'  

    # Name of the instance resource to start.
    instance = 'mc-server'

    request = service.instances().stop(project=project, zone=zone, instance=instance)
    response = request.execute()

    print('VM Instance stopped')
