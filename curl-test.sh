#!/bin/bash

curl -X POST http://localhost:5000/api/timeline_post -d "$1"

echo "Showing results"
curl -X GET http://localhost:5000/api/timeline_post

echo "Deleting results"
curl -X DELETE http://localhost:5000/api/timeline_post

echo "showing that results were deleted"
curl -X GET http://localhost:5000/api/timeline_post
