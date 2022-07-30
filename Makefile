LDLIBS=-lm -lstdc++ -lprotobuf
linux-sandbox: linux-sandbox.o linux-sandbox-options.o linux-sandbox-pid1.o process-tools.o logging.o execution_statistics.pb.cc

clean:
	rm -f *.o linux-sandbox

proto:
	protoc --cpp_out=. execution_statistics.proto

UPDATE_URL=https://raw.githubusercontent.com/bazelbuild/bazel/master/src/main/tools
update:
	curl -O -s ${UPDATE_URL}/linux-sandbox.cc
	curl -O -s ${UPDATE_URL}/linux-sandbox.h
	curl -O -s ${UPDATE_URL}/linux-sandbox-options.cc
	curl -O -s ${UPDATE_URL}/linux-sandbox-options.h
	curl -O -s ${UPDATE_URL}/linux-sandbox-pid1.cc
	curl -O -s ${UPDATE_URL}/linux-sandbox-pid1.h
	curl -O -s ${UPDATE_URL}/logging.cc
	curl -O -s ${UPDATE_URL}/logging.h
	sed -i 's/src\/main\/tools\///g' *.h *.cc
