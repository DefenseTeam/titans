curl -XPUT http://localhost:9527/tasks/upload/ -F file=@/titans/bro_http_file_upload_attack.yml

curl -XPOST http://localhost:9527/tasks/run/bro_http_file_upload_attack