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

        tags = {'amenity': ['hospital', 'clinic'],
                'building': 'hospital',
                'emergency': 'ambulance_station',
                'contact':'email',
                'facility': 'operating_theatre',
                'facility':'x-ray',
            }
        
        gdf = ox.geometries.geometries_from_point((lng,lat), tags, dist=5000).head(6)   # find the hospital around 5km
        phone = gdf['phone'].to_json()
        name = gdf['name'].to_json()
        website = gdf['website'].to_json()
        location = gdf['geometry'].to_json()
        email = gdf['contact:email'].to_json()
        emergency = gdf['emergency'].to_json()
        toilet_wheelchair = gdf['toilets:wheelchair'].to_json()
        wheel_chair = gdf['wheelchair'].to_json()
        addr_city = gdf['addr:city'].to_json()
        addr_street = gdf['addr:street'].to_json()
        desc = gdf['description'].to_json()
        cap_bed = gdf['capacity:beds'].to_json()
        icu = gdf['facility:ICU'].to_json()
        operation_theatre = gdf['facility:operating_theatre'].to_json()
        vendilator = gdf['facility:ventilator'].to_json()
        x_ray = gdf['facility:x-ray'].to_json()
        toilets = gdf['toilets'].to_json()
        opening_hour = gdf['opening_hours'].to_json()
        person_capacity = gdf['capacity:persons'].to_json()
        return jsonify({
            "name" : name,
            "phone":phone,
            "website": website,
            "location":location,
            "email":email,
            "emergency":emergency, 
            "toilet_wheelchair":toilet_wheelchair,
            "wheelchair":wheel_chair,
            "addr_city": addr_city,
            "addr_street":addr_street,
            "description": desc,
            "capacity_bed":cap_bed,
            "icu":icu,
            "operation_theatre":operation_theatre,
            "vendilator" : vendilator,
            "x_ray" : x_ray,
            "toilets" : toilets,
            "opening_hour" : opening_hour,
            "person_capacity" : person_capacity
        })
    else:
       return jsonify({"message": "Completed Task"})   

if __name__ == '__main__':
    app.run(debug=True)