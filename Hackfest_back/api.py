from flask import Flask, redirect, request, jsonify
import osmnx as ox
import json


app=Flask(__name__)
@app.route('/distance', methods=['GET', 'POST'])
def giveInfo():  
    if request.method == 'POST':
        request_data = request.data
        print(request_data)
        request_data = json.loads(request_data.decode('utf-8'))
        lng = request_data['lng']
        lat = request_data['lat']
        # print(lng)

        tags = {'amenity': ['hospital', 'clinic'],
                'building': 'hospital',
                'emergency': 'ambulance_station',
                'contact':'email',
                'facility': 'operating_theatre',
                'facility':'x-ray',
            }
        
        gdf = ox.geometries.geometries_from_point((lng,lat), tags, dist=5000).head(5)   # find the hospital around 5km
        file = gdf.to_json()
        # phone = gdf['phone']
        # name = gdf['name']
        # website = gdf['website']
        # location = gdf['geometry']
        # email = gdf['contact:email']
        # emergency = gdf['emergency'].to_json()
        # toilet_wheelchair = gdf['toilets:wheelchair'].to_json()
        # wheel_chair = gdf['wheelchair'].to_json()
        # addr_city = gdf['addr:city'].to_json()
        # addr_street = gdf['addr:street'].to_json()
        # desc = gdf['description'].to_json()
        # cap_bed = gdf['capacity:beds'].to_json()
        # icu = gdf['facility:ICU'].to_json()
        # operation_theatre = gdf['facility:operating_theatre'].to_json()
        # vendilator = gdf['facility:ventilator'].to_json()
        # x_ray = gdf['facility:x-ray'].to_json()
        # toilets = gdf['toilets'].to_json()
        # opening_hour = gdf['opening_hours'].to_json()
        # person_capacity = gdf['capacity:persons'].to_json()
        return jsonify({
        #    "name": name,
        #    "phone" : phone,
        #    "website" : website, 
        #    "email" : email,
        "file" : file,

        }), 200
    else:
       return jsonify({"message": "Completed Task"}),200


if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0', port=7778)
