from googleapiclient import discovery

def start_server_pubsub(event, context):
   
    service = discovery.build('compute', 'v1')
    print('VM Instance starting')

    # Project ID for this request.
    project = 'minecraft-xxxxxx' 

    # The name of the zone for this request.
    zone = 'australia-southeast1-a'  

    # Name of the instance resource to start.
    instance = 'mc-server'

    request = service.instances().start(project=project, zone=zone, instance=instance)
    response = request.execute()

    print('VM Instance started')
