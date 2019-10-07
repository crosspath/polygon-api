APIs:

* `/polygons/`:  
  `curl -X GET http://localhost:3000/polygons/`
* `/points/check`:  

      curl -X POST http://localhost:3000/points/check \
      -d 'point={"type":"Point","coordinates":[8,51]}'
