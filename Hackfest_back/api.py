from flask import Flask, redirect, request, jsonify
import osmnx as ox
import json


app=Flask(__name__)
@app.route('/distance', methods=['GET', 'POST'])
def giveInfo():  
    if request.method == 'POST':
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        lng = request_data['lng']
        lat = request_data['lat']

        tags = {'amenity': 'hospital',
                'building': 'hospital',
                'emergency': 'ambulance_station'

            }
        
        gdf = ox.geometries.geometries_from_point((lng,lat), tags, dist=5000).head(6)   # find the hospital around 5km
  
        json_file = gdf.to_json()
        return jsonify({"file":json_file})
    else:
       return jsonify({"message": "Completed Task"})   

if __name__ == '__main__':
    app.run(debug=True)